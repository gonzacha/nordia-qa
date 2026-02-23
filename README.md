# 🏭 Nordia Quality Factory

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Status](https://img.shields.io/badge/status-active-success.svg)
![License](https://img.shields.io/badge/license-Proprietary-red.svg)

**Sistema de QA Automatizado con IA para Startups LATAM**

*"La calidad no es un afterthought. Es una ventaja competitiva."*

[Manual Completo](./manual/NORDIA-QUALITY-FACTORY-MANUAL-v1.0.md) •
[Pocket QA](./pocket/POCKET-QA-v2.5.md) •
[QA Agent](./agent/)

</div>

---

## 🎯 ¿Qué es Nordia Quality Factory?

Nordia Quality Factory (NQF) es el sistema integral de aseguramiento de calidad de **Nordia Technologies**. Combina inteligencia artificial conversacional con testing real de interfaces.

### Visión

> *"Un sistema donde cualquier tester pueda decir en lenguaje natural 'Probá el flujo de venta con carrito vacío' y el sistema lo ejecute, documente y reporte automáticamente."*

### Para quién es

- 🏪 **Startups LATAM** que quieren QA profesional sin equipos grandes
- 🥩 **Comercios de barrio** (carnicerías, verdulerías, kioscos) que usan Nordia POS
- 👨‍💻 **Desarrolladores** que quieren automatizar testing con IA

---

## 🏗️ Arquitectura de 4 Capas

```
┌─────────────────────────────────────────────────────────┐
│               NORDIA QUALITY FACTORY                     │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐         │
│  │  CAPA 1    │  │  CAPA 2    │  │  CAPA 3    │         │
│  │  Analyzer  │  │  Inspector │  │  Pilot     │         │
│  │  (Estático)│  │  (Dinámico)│  │  (UI Test) │         │
│  │  ✅ v2.0   │  │  🟡 v3.0   │  │  🟡 Futuro │         │
│  └────────────┘  └────────────┘  └────────────┘         │
│         │              │               │                 │
│         └──────────────┼───────────────┘                 │
│                        ▼                                 │
│               ┌────────────────┐                         │
│               │    CAPA 4      │                         │
│               │    Brain       │                         │
│               │  (IA Central)  │                         │
│               │  🔴 Conceptual │                         │
│               └────────────────┘                         │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

| Capa | Nombre | Estado | Descripción |
|------|--------|--------|-------------|
| 1 | **Analyzer** | ✅ v2.0 | Análisis estático con Claude API |
| 2 | **Inspector** | 🟡 Pendiente | Análisis dinámico con Playwright |
| 3 | **Pilot** | 🟡 Pendiente | Testing interactivo con IA |
| 4 | **Brain** | 🔴 Conceptual | IA que aprende y predice bugs |

---

## 📁 Estructura del Repositorio

```
nordia-qa/
├── README.md              # Este archivo
├── CHANGELOG.md           # Historial de cambios
├── manual/                # Documentación completa
│   ├── NORDIA-QUALITY-FACTORY-MANUAL-v1.0.md
│   └── archive/           # Versiones anteriores
├── pocket/                # Resúmenes ejecutivos
│   ├── POCKET-QA-v1.0.md
│   ├── POCKET-QA-v2.5.md
│   └── archive/
├── specs/                 # Especificaciones técnicas
│   ├── nordia-quality-factory-spec.json
│   └── chatgpt-zenith-qa-v1.0.pdf
├── templates/             # Plantillas reutilizables
│   ├── BUG-TEMPLATE.json
│   ├── TESTCASE-TEMPLATE.json
│   └── QA-RELEASE-CONTRACT.md
├── checklists/            # Listas de verificación
│   ├── SMOKE-TESTS.md
│   └── verticales/
│       ├── CARNICERIA.md
│       ├── VERDULERIA.md
│       └── KIOSCO.md
├── agent/                 # QA Agent (herramienta)
│   └── nordia-qa-agent.html
└── scripts/               # Scripts de automatización
```

---

## 🚀 Quick Start

### 1. Clonar el repositorio

```bash
git clone https://github.com/gonzacha/nordia-qa.git
cd nordia-qa
```

### 2. Usar el QA Agent

Abrir `agent/nordia-qa-agent.html` en el navegador y configurar tu API key de Anthropic.

### 3. Leer el Pocket QA

Para uso diario, revisar [pocket/POCKET-QA-v2.5.md](./pocket/POCKET-QA-v2.5.md).

---

## 🧾 QA Ledger (one-time setup)

The QSD observability workflow writes JSONL history to an orphan branch named `qa-ledger`.

```bash
git checkout --orphan qa-ledger
git rm -rf .
mkdir -p data
touch data/qa_history.jsonl
git add data/qa_history.jsonl
git commit -m "chore: init qa ledger"
git push origin qa-ledger
git checkout main
```

---

## 📋 Las 3 Reglas Sagradas

1. **🚫 Nada se deploya sin pasar los 10 Smoke Tests**

2. **📝 Todo bug debe tener:**
   - Pasos reproducibles
   - Severidad
   - Evidencia visual
   - Impacto en comercio real

3. **🤖 Orden obligatorio:**
   - Primero: QA Agent (automático)
   - Después: QA Manual (flujos críticos)

---

## 👥 Equipo

| Rol | Responsable | Responsabilidades |
|-----|-------------|-------------------|
| **Founder & QA Lead** | Gonzalo Haedo | Decisiones finales, testing manual experto |
| **Director Técnico QA** | Claude Opus 4.5 | Arquitectura, automatización, implementación |
| **Auditor Externo QA** | ChatGPT Zenith | Metodología, estándares, auditorías |

---

## 🗺️ Roadmap

### Fase 1: Fundamentos ✅
- [x] Manual completo v1.0
- [x] Pocket QA v1.0
- [x] QA Agent v2.0
- [x] Estructura de repositorio

### Fase 2: QA Agent v3.0 🟡
- [ ] Backend Node.js local
- [ ] Integración Playwright
- [ ] Métricas de performance reales
- [ ] Captura automática de evidencia

### Fase 3: NQF Pilot 🔴
- [ ] Testing con lenguaje natural
- [ ] Generación de videos
- [ ] Modo exploración

### Fase 4: NQF Brain 🔴
- [ ] Memoria de bugs
- [ ] Predicción de regresiones
- [ ] Dashboard de salud

### Fase 5: Productización 🔴
- [ ] NQF como SaaS
- [ ] Documentación pública
- [ ] Certificación Nordia QA

---

## 📚 Documentación

| Documento | Descripción | Link |
|-----------|-------------|------|
| **Manual Completo** | Biblia de QA (2500+ líneas) | [Ver](./manual/NORDIA-QUALITY-FACTORY-MANUAL-v1.0.md) |
| **Pocket QA** | Resumen de 1 página | [Ver](./pocket/POCKET-QA-v2.5.md) |
| **Spec Técnica** | JSON con arquitectura | [Ver](./specs/nordia-quality-factory-spec.json) |
| **Smoke Tests** | 10 tests obligatorios | [Ver](./checklists/SMOKE-TESTS.md) |

---

## 🔗 Links Relacionados

- **Nordia POS:** [github.com/gonzacha/nordia-pos](https://github.com/gonzacha/nordia-pos)
- **Landing:** [nordia.uno/pos](https://nordia.uno/pos)
- **App:** [nordia-pos-real.vercel.app](https://nordia-pos-real.vercel.app)

---

## 📄 Licencia

Propietary © 2025 Nordia Technologies. Corrientes, Argentina.

Todos los derechos reservados.

---

<div align="center">

**Nordia Quality Factory**

*"No hacemos el POS más moderno. Hacemos el primer sistema de ventas para quienes nunca tuvieron uno."*

🇦🇷 Hecho en Corrientes, Argentina

</div>
