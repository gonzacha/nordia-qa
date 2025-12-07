# Changelog

Todos los cambios notables en Nordia Quality Factory serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

---

## [Unreleased]

### Planned
- QA Agent v3.0 con Playwright
- Integración Inspector (Capa 2)
- Métricas de performance reales

---

## [1.0.0] - 2025-12-07

### 🎉 Release Inicial - "Genesis"

Primera versión estable de Nordia Quality Factory.

### Added

#### Documentación
- **Manual Completo v1.0** - 2500+ líneas de documentación profesional
  - Arquitectura de 4 capas (Analyzer, Inspector, Pilot, Brain)
  - Gobernanza y roles definidos
  - Matriz de severidad y prioridad
  - Flujo de QA con gates
  - Métricas SRE (MTTR, MTBF, SLOs)
  
- **Pocket QA v1.0** - Resumen ejecutivo de 1 página
  - 3 Reglas Sagradas
  - 10 Smoke Tests obligatorios
  - Checklist pre-deploy
  
- **Pocket QA v2.5** - Versión mejorada
  - Métricas clave agregadas
  - Checklist post-deploy
  - Sección de escalamiento
  - Tests por vertical
  
#### Herramientas
- **QA Agent v2.0** - Herramienta de análisis con Claude API
  - 6 tipos de análisis (Funcional, UX, Security, Performance, Accessibility, Full)
  - Contexto Nordia integrado
  - Diferenciación MVP vs Producción
  - Exportación de bugs en Markdown
  
#### Templates
- Plantilla JSON de Bug
- Plantilla JSON de Test Case
- QA Release Contract

#### Checklists
- 10 Smoke Tests obligatorios
- Checklists por vertical (Carnicería, Verdulería, Kiosco)

### Equipo
- **Gonzalo Haedo** - Founder & QA Lead
- **Claude Opus 4.5** - Director Técnico QA
- **ChatGPT Zenith** - Auditor Externo QA

### Contexto
- Sprint de 49+ horas de desarrollo
- Nordia POS MVP funcionando
- Landing deployada en nordia.uno/pos
- 2 análisis QA ejecutados (desktop + móvil)
- Bugs críticos identificados y documentados

---

## [0.2.0] - 2025-12-07

### Added
- QA Agent v2.0 con mejoras de prompts
- Spec JSON de arquitectura
- Análisis móvil y desktop

### Changed
- Prompts optimizados para contexto argentino
- Diferenciación MVP vs Enterprise

### Fixed
- Fecha incorrecta en spec (2024 → 2025)

---

## [0.1.0] - 2025-12-07

### Added
- QA Agent v1.0 (versión inicial)
- Primeros análisis de Nordia POS

### Known Issues
- Métricas inventadas sin verificación
- Análisis como producto enterprise (no MVP)
- Bugs reportados sin evidencia

---

## Leyenda

- 🎉 Release mayor
- ✨ Nueva funcionalidad
- 🐛 Bug fix
- 📝 Documentación
- 🔧 Configuración
- ⚠️ Deprecación

---

## Links

- [Repositorio](https://github.com/gonzacha/nordia-qa)
- [Nordia POS](https://github.com/gonzacha/nordia-pos)
- [Manual Completo](./manual/NORDIA-QUALITY-FACTORY-MANUAL-v1.0.md)
