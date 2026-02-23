#!/usr/bin/env bash

set -u

raw_json="${1:-}"
ledger_path="${2:-}"

fallback_json() {
  jq -cn \
    --arg ts "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
    --arg err "internal_error: invalid_module_json" \
    '{
      ts: $ts,
      base_url: "",
      cat: "",
      status: "FAIL",
      execution_ms: 0,
      layers: {L1:"FAIL", L2:"FAIL", L3:"FAIL"},
      metrics: {
        feeds_count: 0,
        rank_count: 0,
        dupe_url_count: 0,
        english_suspects: 0,
        echo_detected: 0,
        echo_flag_missing: 0,
        missing_fields: 0
      },
      warnings: [],
      errors: [$err]
    }'
}

if ! echo "$raw_json" | jq -e . >/dev/null 2>&1; then
  raw_json="$(fallback_json)"
fi

status="$(echo "$raw_json" | jq -r '.status // "FAIL"' 2>/dev/null || echo "FAIL")"
english_suspects="$(echo "$raw_json" | jq -r '.metrics.english_suspects | tonumber? // 0' 2>/dev/null || echo "0")"
missing_fields="$(echo "$raw_json" | jq -r '.metrics.missing_fields | tonumber? // 0' 2>/dev/null || echo "0")"
feeds_count="$(echo "$raw_json" | jq -r '.metrics.feeds_count | tonumber? // 0' 2>/dev/null || echo "0")"

score=100
if [[ "$status" == "FAIL" ]] || [[ "$english_suspects" -gt 0 ]]; then
  score=0
else
  penalty="$(( missing_fields * 10 ))"
  if [[ "$penalty" -gt 50 ]]; then
    penalty=50
  fi
  score="$(( 100 - penalty ))"
  if [[ "$feeds_count" -eq 0 ]]; then
    score="$(( score - 30 ))"
  fi
  if [[ "$score" -lt 0 ]]; then
    score=0
  fi
  if [[ "$score" -gt 100 ]]; then
    score=100
  fi
fi

prev_state="GREEN"
if [[ -n "$ledger_path" && -s "$ledger_path" ]]; then
  last_line="$(tail -n 1 "$ledger_path" 2>/dev/null || true)"
  if [[ -n "$last_line" ]]; then
    prev_state="$(printf '%s\n' "$last_line" | jq -r '.observability.state // empty' 2>/dev/null || true)"
    if [[ -z "$prev_state" ]]; then
      prev_state="GREEN"
    fi
  fi
fi

history_scores="$(tail -n 5 "$ledger_path" 2>/dev/null || true)"
avg_score_6h="$(printf '%s\n' "$history_scores" | jq -Rsc --argjson current "$score" '
  split("\n")[:-1]
  | map(fromjson? | .observability.score | tonumber? // empty)
  | . as $scores
  | ($scores + [$current]) as $all
  | if ($all | length) == 0 then 0 else (( $all | add ) / ($all | length) | floor) end
' 2>/dev/null || echo "0")"

history_statuses="$(tail -n 2 "$ledger_path" 2>/dev/null || true)"
strikes_3="$(printf '%s\n' "$history_statuses" | jq -Rsc --arg current "$status" '
  split("\n")[:-1]
  | map(fromjson? | .status // empty)
  | . as $hist
  | ($hist + [$current]) as $all
  | ([$all[] | select(. == "FAIL")] | length) as $count
  | if ($all | length) == 3 and $count == 3 then 3 else $count end
' 2>/dev/null || echo "0")"

state="GREEN"
if [[ "$strikes_3" -eq 3 ]]; then
  state="RED"
elif [[ "$avg_score_6h" -lt 70 ]]; then
  state="ORANGE"
elif [[ "$avg_score_6h" -lt 90 ]]; then
  state="YELLOW"
fi

alert="NONE"
if [[ "$state" == "RED" && "$prev_state" != "RED" ]]; then
  alert="ENTER_RED"
elif [[ "$state" == "ORANGE" && "$prev_state" != "ORANGE" ]]; then
  alert="ENTER_ORANGE"
elif [[ "$state" == "GREEN" && "$prev_state" != "GREEN" ]]; then
  alert="RECOVERY"
fi

enriched_json="$(
  echo "$raw_json" | jq -c \
    --argjson score "$score" \
    --argjson avg_score_6h "$avg_score_6h" \
    --argjson strikes_3 "$strikes_3" \
    --arg state "$state" \
    --arg prev_state "$prev_state" \
    --arg alert "$alert" \
    '.observability = {
      score: $score,
      avg_score_6h: $avg_score_6h,
      strikes_3: $strikes_3,
      state: $state,
      prev_state: $prev_state,
      alert: $alert
    }' 2>/dev/null
)"

if [[ -z "$enriched_json" ]]; then
  enriched_json="$(printf '{"ts":"%s","base_url":"","cat":"","status":"FAIL","execution_ms":0,"layers":{"L1":"FAIL","L2":"FAIL","L3":"FAIL"},"metrics":{"feeds_count":0,"rank_count":0,"dupe_url_count":0,"english_suspects":0,"echo_detected":0,"echo_flag_missing":0,"missing_fields":0},"warnings":[],"errors":["internal_error: observability_enrich_failed"],"observability":{"score":0,"avg_score_6h":0,"strikes_3":0,"state":"RED","prev_state":"GREEN","alert":"ENTER_RED"}}\n' "$(date -u +"%Y-%m-%dT%H:%M:%SZ")")"
fi

printf '%s\n' "$enriched_json"
