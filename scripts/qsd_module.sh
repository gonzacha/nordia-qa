#!/usr/bin/env bash
set -euo pipefail

base_url="${BASE_URL:-https://qsd-seven.vercel.app}"
cat_name="${CAT:-corrientes}"
limit="${LIMIT:-10}"

now_ms() {
  local ms
  ms="$(date +%s%3N 2>/dev/null || true)"
  if [[ "$ms" == *N* || -z "$ms" ]]; then
    ms="$(( $(date +%s) * 1000 ))"
  fi
  printf '%s' "$ms"
}

start_ms="$(now_ms)"
ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

feeds_url="${base_url%/}/api/feeds?cat=${cat_name}"
rank_url="${base_url%/}/api/rank?cat=${cat_name}&limit=${limit}"

warnings=()
errors=()

add_warn() { warnings+=("$1"); }
add_err()  { errors+=("$1"); }

json_array_from_lines() {
  # Reads lines from stdin, outputs JSON array (filters empty lines)
  jq -Rsc 'split("\n")[:-1] | map(select(length>0))'
}

warnings_json="[]"
errors_json="[]"

build_arrays() {
  if (( ${#warnings[@]} > 0 )); then
    warnings_json="$(printf '%s\n' "${warnings[@]}" | json_array_from_lines 2>/dev/null || echo '[]')"
  fi
  if (( ${#errors[@]} > 0 )); then
    errors_json="$(printf '%s\n' "${errors[@]}" | json_array_from_lines 2>/dev/null || echo '[]')"
  fi
}

fetch() {
  # Prints: "<body>\n<http_code>"
  local url="$1"
  curl -sS -w '\n%{http_code}' "$url"
}

# --- Fetch FEEDS
feeds_resp="$(fetch "$feeds_url" || true)"
feeds_status="${feeds_resp##*$'\n'}"
feeds_body="${feeds_resp%$'\n'*}"

if [[ "$feeds_status" != "200" ]]; then
  add_err "L1: FEEDS http_status=${feeds_status}"
fi

# --- Fetch RANK
rank_resp="$(fetch "$rank_url" || true)"
rank_status="${rank_resp##*$'\n'}"
rank_body="${rank_resp%$'\n'*}"

if [[ "$rank_status" != "200" ]]; then
  add_err "L1: RANK http_status=${rank_status}"
fi

# JSON parse checks (HARD FAIL if invalid)
if ! echo "$feeds_body" | jq -e . >/dev/null 2>&1; then
  add_err "L1: FEEDS invalid_json"
fi

if ! echo "$rank_body" | jq -e . >/dev/null 2>&1; then
  add_err "L1: RANK invalid_json"
fi

# If L1 hard errors already, still compute metrics best-effort but final status will be FAIL.

# --- Metrics & checks with jq (best-effort, but any jq failure becomes error)
feeds_count="$(echo "$feeds_body" | jq -r '(.items // []) | length' 2>/dev/null || echo "0")"
rank_count="$(echo "$rank_body"  | jq -r '(.items // []) | length' 2>/dev/null || echo "0")"

# HARD FAIL: rank must have >0
if [[ "$rank_count" == "0" ]]; then
  add_err "L1: RANK items=0"
fi

# ---- L2: required fields + url scheme
missing_fields="$(
  jq -n \
    --arg feeds "$feeds_body" \
    --arg rank  "$rank_body" \
    '
    def F: ($feeds | fromjson);
    def R: ($rank  | fromjson);

    def bad_str(x): (x|type!="string") or (x|length==0);
    def bad_url(u): bad_str(u) or ((u|test("^https?://"))|not);

    def feeds_missing:
      [(F.items // [])[] | select(bad_str(.title) or bad_url(.url // .link))] | length;

    def rank_missing:
      [(R.items // [])[] | select(bad_str(.title) or bad_url(.url) or (.editorial_score == null))] | length;

    (feeds_missing + rank_missing)
    ' 2>/dev/null || echo "0"
)"

if ! [[ "$missing_fields" =~ ^[0-9]+$ ]]; then
  missing_fields="0"
  add_err "L2: missing_fields_jq_failed"
fi

if [[ "$missing_fields" != "0" ]]; then
  add_err "L2: missing_required_fields count=${missing_fields}"
fi

# ---- L2: duplicate urls (WARN)
dupe_url_count="$(
  echo "$feeds_body" | jq -r '
    def norm(u):
      (u // "") | tostring
      | split("?")[0] | split("#")[0]
      | gsub("\\s+";"")
      | ascii_downcase;

    [(.items // [])[] | norm(.url // .link)] as $u
    | ($u | sort | group_by(.) | map(select(length>1) | (length-1)) | add) // 0
  ' 2>/dev/null || echo "0"
)"

if ! [[ "$dupe_url_count" =~ ^[0-9]+$ ]]; then
  dupe_url_count="0"
  add_err "L2: dupe_url_jq_failed"
fi

if [[ "$dupe_url_count" != "0" ]]; then
  add_warn "L2: duplicate_urls count=${dupe_url_count}"
fi

# ---- L2: English leak (HARD FAIL) — >=2 tokens in same title
english_suspects="$(
  echo "$feeds_body" | jq -r '
    def suspect_title(t):
      ((" " + (t//"") + " ") | ascii_downcase) as $s
      | ([
          " the ", " and ", " is ", " with ", " of "
        ] | map(. as $tok | select($s | contains($tok))) | length) as $m
      | ($m >= 2);

    [(.items // [])[] | select(suspect_title(.title))] | length
  ' 2>/dev/null || echo "0"
)"

if ! [[ "$english_suspects" =~ ^[0-9]+$ ]]; then
  english_suspects="0"
  add_err "L2: english_suspects_jq_failed"
fi

if [[ "$english_suspects" != "0" ]]; then
  add_err "L2: english_leak suspects=${english_suspects}"
fi

# ---- L3: echo true-positive vs quality flag (WARN)
echo_detected="$(
  echo "$rank_body" | jq -r '
    def norm(s): (s // "") | tostring | ascii_downcase | gsub("[^a-z0-9]+";"");
    def has_flag(flags; name): (flags // []) | index(name) != null;

    [(.items // [])[] |
      . as $it
      | (norm($it.title)) as $t
      | (norm($it.description // $it.dek // $it.summary // "")) as $d
      | (
          ($d == $t) or
          (($d | contains("ensintesis")) and ($d | contains($t))) or
          (($d | contains("panorama")) and ($d | contains($t)))
        )
    | select(. == true)
    ] | length
  ' 2>/dev/null || echo "0"
)"

echo_flag_missing="$(
  echo "$rank_body" | jq -r '
    def norm(s): (s // "") | tostring | ascii_downcase | gsub("[^a-z0-9]+";"");
    def has_flag(flags; name): (flags // []) | index(name) != null;

    [(.items // [])[] |
      . as $it
      | (norm($it.title)) as $t
      | (norm($it.description // $it.dek // $it.summary // "")) as $d
      | (
          ($d == $t) or
          (($d | contains("ensintesis")) and ($d | contains($t))) or
          (($d | contains("panorama")) and ($d | contains($t)))
        ) as $echo
      | select($echo == true)
      | select(has_flag($it.quality_flags; "title_echo_desc") | not)
    ] | length
  ' 2>/dev/null || echo "0"
)"

if ! [[ "$echo_detected" =~ ^[0-9]+$ ]]; then
  echo_detected="0"
  add_err "L3: echo_detected_jq_failed"
fi
if ! [[ "$echo_flag_missing" =~ ^[0-9]+$ ]]; then
  echo_flag_missing="0"
  add_err "L3: echo_flag_missing_jq_failed"
fi

if [[ "$echo_flag_missing" != "0" ]]; then
  add_warn "L3: echo_without_title_echo_desc flag_missing=${echo_flag_missing}"
fi

# WARN if feeds_count == 0 (rank still ok)
if [[ "$feeds_count" == "0" ]]; then
  add_warn "L1: FEEDS items=0 (possible transient feed starvation)"
fi

# --- Determine status
l1="PASS"; l2="PASS"; l3="PASS"
status="PASS"

# Hard errors => FAIL
if (( ${#errors[@]} > 0 )); then
  status="FAIL"
  l1="FAIL"
  l2="FAIL"
  l3="FAIL"
else
  # warnings => WARN
  if (( ${#warnings[@]} > 0 )); then
    status="WARN"
    # Layer attribution (coarse):
    l2="WARN"
    l3="WARN"
  fi
fi

end_ms="$(now_ms)"
execution_ms="$(( end_ms - start_ms ))"

build_arrays
warnings_json="${warnings_json:-[]}"
errors_json="${errors_json:-[]}"

# Print single-line JSON
final_out="$(
  jq -cn \
    --arg ts "$ts" \
    --arg base_url "$base_url" \
    --arg cat "$cat_name" \
    --arg status "$status" \
    --argjson execution_ms "$execution_ms" \
    --argjson feeds_count "$feeds_count" \
    --argjson rank_count "$rank_count" \
    --argjson dupe_url_count "$dupe_url_count" \
    --argjson english_suspects "$english_suspects" \
    --argjson echo_detected "$echo_detected" \
    --argjson echo_flag_missing "$echo_flag_missing" \
    --argjson missing_fields "$missing_fields" \
    --arg l1 "$l1" --arg l2 "$l2" --arg l3 "$l3" \
    --argjson warnings "$warnings_json" \
    --argjson errors   "$errors_json" \
    '{
      ts: $ts,
      base_url: $base_url,
      cat: $cat,
      status: $status,
      execution_ms: $execution_ms,
      layers: {L1:$l1, L2:$l2, L3:$l3},
      metrics: {
        feeds_count: $feeds_count,
        rank_count: $rank_count,
        dupe_url_count: $dupe_url_count,
        english_suspects: $english_suspects,
        echo_detected: $echo_detected,
        echo_flag_missing: $echo_flag_missing,
        missing_fields: $missing_fields
      },
      warnings: $warnings,
      errors: $errors
    }' 2>/dev/null
)" || final_out="$(
  printf '{"ts":"%s","base_url":"%s","cat":"%s","status":"FAIL","execution_ms":%s,"layers":{"L1":"FAIL","L2":"FAIL","L3":"FAIL"},"metrics":{"feeds_count":0,"rank_count":0,"dupe_url_count":0,"english_suspects":0,"echo_detected":0,"echo_flag_missing":0,"missing_fields":0},"warnings":[],"errors":["internal_error: jq_output_failed"]}\n' \
    "$ts" "$base_url" "$cat_name" "$execution_ms"
)"
printf '%s\n' "$final_out"

# Exit code: 1 only on FAIL
if [[ "$status" == "FAIL" ]]; then
  exit 1
fi
exit 0
