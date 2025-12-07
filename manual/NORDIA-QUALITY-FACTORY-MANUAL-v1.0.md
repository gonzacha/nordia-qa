# NORDIA QUALITY FACTORY
## Manual Completo v1.0

**Documento Fundacional de Calidad de Software**

---

| Campo | Valor |
|-------|-------|
| **Versión** | 1.0 |
| **Fecha** | 7 de diciembre de 2025 |
| **Autores** | Claude Opus 4.5 (Arquitectura Técnica) + ChatGPT Zenith (Metodología QA) |
| **Aprobado por** | Gonzalo Haedo - Founder & QA Lead |
| **Proyecto** | Nordia POS |
| **Organización** | Nordia Technologies |
| **Ubicación** | Corrientes, Argentina |

---

# ÍNDICE

## PARTE I: FUNDAMENTOS
1. [Introducción y Visión](#1-introducción-y-visión)
2. [Misión de Nordia Quality Factory](#2-misión-de-nordia-quality-factory)
3. [Gobernanza y Roles de QA](#3-gobernanza-y-roles-de-qa)

## PARTE II: ARQUITECTURA TÉCNICA
4. [Arquitectura de 4 Capas](#4-arquitectura-de-4-capas)
5. [NQF Analyzer (Capa 1)](#5-nqf-analyzer-capa-1)
6. [NQF Inspector (Capa 2)](#6-nqf-inspector-capa-2)
7. [NQF Pilot (Capa 3)](#7-nqf-pilot-capa-3)
8. [NQF Brain (Capa 4)](#8-nqf-brain-capa-4)
9. [Especificación Técnica del QA Agent v3](#9-especificación-técnica-del-qa-agent-v3)
10. [Seguridad y Anti-Alucinaciones](#10-seguridad-y-anti-alucinaciones)

## PARTE III: METODOLOGÍA QA
11. [Matriz de Severidad y Prioridad](#11-matriz-de-severidad-y-prioridad)
12. [Flujo de QA y Criterios de Salida](#12-flujo-de-qa-y-criterios-de-salida)
13. [Tipos de Testing](#13-tipos-de-testing)
14. [Las 3 Reglas Sagradas de QA Nordia](#14-las-3-reglas-sagradas-de-qa-nordia)

## PARTE IV: PLANTILLAS Y ARTEFACTOS
15. [Plantilla JSON de Bug](#15-plantilla-json-de-bug)
16. [Plantilla JSON de Caso de Prueba](#16-plantilla-json-de-caso-de-prueba)
17. [QA Release Contract](#17-qa-release-contract)

## PARTE V: TESTING OPERATIVO
18. [Lista de Smoke Tests (10 Obligatorios)](#18-lista-de-smoke-tests)
19. [Escenarios Rápidos para QA Agent (20)](#19-escenarios-rápidos-para-qa-agent)
20. [Checklists por Vertical](#20-checklists-por-vertical)

## PARTE VI: MÉTRICAS Y KPIS
21. [Indicadores de Confiabilidad](#21-indicadores-de-confiabilidad)
22. [Indicadores de Defectos](#22-indicadores-de-defectos)
23. [SLOs y SLIs de Nordia POS](#23-slos-y-slis-de-nordia-pos)

## PARTE VII: ROADMAP
24. [Roadmap Quirúrgico (5 Fases)](#24-roadmap-quirúrgico)
25. [Criterios de Éxito por Fase](#25-criterios-de-éxito-por-fase)

## ANEXOS
- [Anexo A: Contexto de Nordia POS](#anexo-a-contexto-de-nordia-pos)
- [Anexo B: Glosario de Términos](#anexo-b-glosario-de-términos)
- [Anexo C: Referencias](#anexo-c-referencias)

---

# PARTE I: FUNDAMENTOS

---

## 1. Introducción y Visión

### 1.1 ¿Qué es Nordia Quality Factory?

Nordia Quality Factory (NQF) es el sistema integral de aseguramiento de calidad de Nordia Technologies. Combina inteligencia artificial conversacional con testing real de interfaces, diseñado para ser accesible a equipos pequeños y escalable para empresas grandes.

### 1.2 ¿Por qué este documento?

Nordia POS es un sistema de punto de venta para carnicerías, verdulerías y kioscos de barrio en Argentina. En un comercio real, cada minuto de falla implica ventas perdidas y clientes molestos. La calidad no puede ser un "extra" o un afterthought.

Este estándar busca que todos —desarrolladores, testers, product managers y founders— compartan la misma definición de calidad, conozcan el flujo de verificación y tengan herramientas concretas para medir y mejorar.

### 1.3 Declaración de Visión

> **"Construir el sistema de QA automatizado más avanzado para startups LATAM, que combine IA conversacional con testing real de interfaces, accesible para equipos pequeños y escalable para empresas grandes."**

### 1.4 North Star

> **"Un sistema donde cualquier tester pueda decir en lenguaje natural 'Probá el flujo de venta con carrito vacío' y el sistema lo ejecute, documente y reporte automáticamente."**

### 1.5 Por qué importa

| Stakeholder | Valor que recibe |
|-------------|------------------|
| **Para Nordia** | Calidad como ventaja competitiva desde el día 1 |
| **Para la industria** | Demostrar que una startup de Corrientes puede tener estándares de Silicon Valley |
| **Para Gonzalo** | Posicionarse como QA Engineer + Founder, un perfil único y valioso |
| **Para el mercado** | Producto potencialmente vendible como SaaS de QA para otras startups |

### 1.6 Marco Teórico

Este estándar se inspira en:

- **ISO/IEC 25010**: Modelo de calidad de software que define características como confiabilidad, seguridad y mantenibilidad
- **Google SRE (Site Reliability Engineering)**: Prácticas de confiabilidad y métricas operativas
- **Testing Pyramid**: Estructura de pruebas unitarias, integración y E2E

**Definiciones clave de ISO 25010:**

- **Confiabilidad**: Capacidad de un sistema para cumplir funciones especificadas bajo condiciones definidas durante un periodo de tiempo. Incluye disponibilidad, tolerancia a fallas y recuperabilidad.
- **Mantenibilidad**: Eficacia y eficiencia con que un producto puede modificarse para corregir defectos o adaptarse a cambios. Abarca modularidad, reutilización, analizabilidad, modificabilidad y testabilidad.

---

## 2. Misión de Nordia Quality Factory

### 2.1 Misión por Horizonte Temporal

| Plazo | Misión |
|-------|--------|
| **Corto plazo** | Tener una herramienta de QA interna que detecte bugs antes que los usuarios |
| **Mediano plazo** | Crear el Nordia QA Standard como metodología replicable |
| **Largo plazo** | Convertir Nordia Quality Factory en un producto/servicio vendible |

### 2.2 Principios Fundacionales

1. **NO inventar bugs**: Preferir "No verificable" antes que alucinar métricas o errores
2. **Diferenciar MVP vs Enterprise**: Siempre considerar el contexto del proyecto
3. **Contexto argentino**: Hardware real, internet inestable, usuarios no técnicos
4. **Reportes accionables**: Estructurados y fáciles de convertir en issues de GitHub
5. **Eficiencia de tokens**: Contexto corto y concreto en prompts de IA
6. **Lenguaje local**: Español argentino (voseo, expresiones locales)

### 2.3 Lo que NO es Nordia Quality Factory

- No es burocracia para frenar el desarrollo
- No es perfeccionismo paralizante
- No es un sistema que requiere equipos grandes
- No es teoría sin aplicación práctica

---

## 3. Gobernanza y Roles de QA

### 3.1 Estructura de Roles

```
┌─────────────────────────────────────────────────────────┐
│                    GONZALO HAEDO                         │
│            Founder & QA Lead (Decisor Final)            │
└───────────────────────┬─────────────────────────────────┘
                        │
          ┌─────────────┴─────────────┐
          ▼                           ▼
┌─────────────────────┐     ┌─────────────────────┐
│   CLAUDE OPUS 4.5   │     │   CHATGPT ZENITH    │
│  Director Técnico   │     │   Auditor Externo   │
│        QA           │     │        QA           │
└─────────────────────┘     └─────────────────────┘
          │                           │
          └───────────┬───────────────┘
                      ▼
          ┌─────────────────────┐
          │  EQUIPO DE          │
          │  DESARROLLO         │
          └─────────────────────┘
                      │
                      ▼
          ┌─────────────────────┐
          │  USUARIOS PILOTO    │
          │  (5 comercios)      │
          └─────────────────────┘
```

### 3.2 Responsabilidades por Rol

| Rol | Responsabilidades |
|-----|-------------------|
| **Founder & QA Lead (Gonzalo)** | Define visión de negocio y prioriza; realiza testing manual experto; aprueba el contrato de liberación; decisión final en conflictos |
| **Director Técnico QA (Claude)** | Implementa arquitectura de 4 motores; desarrolla y mantiene QA Agent; integra Playwright, Supabase y servicios; ejecuta pruebas automatizadas; entrega evidencias; documentación técnica |
| **Auditor Externo QA (ChatGPT)** | Diseña estándares y procesos; revisa documentación y artefactos; segunda opinión independiente; ayuda a priorizar bugs; define KPIs y metodología |
| **Equipo de Desarrollo** | Implementa funcionalidades; corrige defectos; escribe pruebas unitarias; participa en code reviews |
| **Usuarios Piloto** | Comercios reales que prueban el producto; reportan defectos desde uso real; su feedback tiene prioridad sobre la estética |

### 3.3 Gates de Aprobación

Cada transición entre fases requiere aprobación explícita:

| Gate | Aprueba | Criterio |
|------|---------|----------|
| Diseño → Desarrollo | QA Lead | Criterios de aceptación completos |
| Desarrollo → Analyzer | Dev Lead | Code review aprobado, tests unitarios |
| Analyzer → Inspector | Director Técnico | Sin hallazgos críticos en análisis estático |
| Inspector → Pilot | Director Técnico | Pruebas automatizadas pasan |
| Pilot → Testing Manual | Director Técnico | Escenarios IA ejecutados |
| Testing Manual → Pre-deploy | QA Lead | Smoke tests 100% |
| Pre-deploy → Deploy | QA Lead + Director | Contrato firmado |

---

# PARTE II: ARQUITECTURA TÉCNICA

---

## 4. Arquitectura de 4 Capas

### 4.1 Diagrama General

```
┌─────────────────────────────────────────────────────────────────┐
│                    NORDIA QUALITY FACTORY                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐         │
│  │   HUMANO     │   │   NQF UI     │   │   CLI        │         │
│  │  (Gonzalo)   │──▶│  (Dashboard) │──▶│  (Terminal)  │         │
│  └──────────────┘   └──────────────┘   └──────────────┘         │
│          │                  │                  │                 │
│          ▼                  ▼                  ▼                 │
│  ┌─────────────────────────────────────────────────────┐        │
│  │              NQF ORCHESTRATOR                        │        │
│  │  (Decide qué capa usar según el request)            │        │
│  └─────────────────────────────────────────────────────┘        │
│          │                  │                  │                 │
│          ▼                  ▼                  ▼                 │
│  ┌────────────┐    ┌────────────┐    ┌────────────┐             │
│  │ CAPA 1     │    │ CAPA 2     │    │ CAPA 3     │             │
│  │ Analyzer   │    │ Inspector  │    │ Pilot      │             │
│  │ (Estático) │    │ (Dinámico) │    │ (UI Test)  │             │
│  └────────────┘    └────────────┘    └────────────┘             │
│          │                  │                  │                 │
│          └──────────────────┼──────────────────┘                 │
│                             ▼                                    │
│                    ┌────────────────┐                            │
│                    │    CAPA 4      │                            │
│                    │    Brain       │                            │
│                    │  (IA Central)  │                            │
│                    └────────────────┘                            │
│                             │                                    │
│                             ▼                                    │
│  ┌─────────────────────────────────────────────────────┐        │
│  │                    OUTPUTS                           │        │
│  │  • Reportes MD    • GitHub Issues    • Slack alerts │        │
│  │  • Videos         • Screenshots      • Métricas     │        │
│  └─────────────────────────────────────────────────────┘        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 4.2 Filosofía de Capas

**"Automatización progresiva"**: Desde análisis estático simple hasta testing de UI inteligente con IA.

Cada capa agrega valor incremental:
- Capa 1: Detecta problemas sin ejecutar nada
- Capa 2: Mide métricas reales del sistema corriendo
- Capa 3: Ejecuta flujos de usuario completos
- Capa 4: Aprende, predice y mejora solo

---

## 5. NQF Analyzer (Capa 1)

### 5.1 Definición

Motor de análisis estático y contextual que analiza código, prompts y documentación sin ejecutar la aplicación.

### 5.2 Tecnologías

- Claude API (Anthropic)
- AST parsing para análisis de código
- Linting rules personalizadas
- Prompt engineering optimizado

### 5.3 Estado Actual

✅ **Implementado** como QA Agent v2.0

### 5.4 Outputs

- Reportes de bugs potenciales en Markdown
- Code smells identificados
- Mejoras sugeridas
- Plantillas de bug generadas automáticamente

### 5.5 Capacidades

| Capacidad | Descripción |
|-----------|-------------|
| Análisis de código | Revisa HTML/JS/TS buscando problemas |
| Sanitización | Detecta inputs no sanitizados |
| Prompts de evaluación | Genera casos de prueba sugeridos |
| Contexto MVP | Diferencia bugs bloqueantes de mejoras |

---

## 6. NQF Inspector (Capa 2)

### 6.1 Definición

Motor de análisis dinámico que inspecciona la aplicación corriendo: DOM, network, console, performance.

### 6.2 Tecnologías

- Playwright (browser automation)
- Chrome DevTools Protocol
- Lighthouse CI (métricas de performance)
- Node.js backend liviano

### 6.3 Estado Actual

🟡 **Pendiente de implementación** (Fase 2 del roadmap)

### 6.4 Outputs

- Métricas de performance reales (FCP, LCP, TTI)
- Errores de consola capturados
- Network failures detectados
- Screenshots automáticos
- Tiempos de carga medidos

### 6.5 Especificación Técnica

```javascript
// Endpoint principal del Inspector
POST /api/inspect
{
  "url": "https://nordia-pos-real.vercel.app",
  "actions": ["load", "screenshot", "console", "network", "lighthouse"],
  "timeout": 30000
}

// Response
{
  "metrics": {
    "fcp": 1234,      // First Contentful Paint (ms)
    "lcp": 2345,      // Largest Contentful Paint (ms)
    "tti": 3456,      // Time to Interactive (ms)
    "cls": 0.05       // Cumulative Layout Shift
  },
  "console_errors": [...],
  "network_failures": [...],
  "screenshot": "base64...",
  "lighthouse_score": 78
}
```

---

## 7. NQF Pilot (Capa 3)

### 7.1 Definición

Motor de ejecución de flujos de usuario reales: clicks, inputs, navegación. Combina IA para decisiones con Playwright para ejecución.

### 7.2 Tecnologías

- Playwright (ejecución de acciones)
- Claude API (interpretación de lenguaje natural)
- Computer Use API (futuro)
- Sistema de grabación de video

### 7.3 Estado Actual

🟡 **Pendiente de implementación** (Fase 3 del roadmap)

### 7.4 Outputs

- Videos de tests ejecutados
- Lista de pasos ejecutados
- Aserciones pass/fail
- Evidencia visual por paso

### 7.5 Flujo de Ejecución

```
Usuario: "Probá una venta simple con 2 productos"
                    │
                    ▼
┌─────────────────────────────────────┐
│  Claude API interpreta el request   │
│  y genera plan de test estructurado │
└─────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────┐
│  Playwright ejecuta el plan:        │
│  1. Navegar a /app/sell             │
│  2. Buscar producto                 │
│  3. Agregar al carrito              │
│  4. Repetir para segundo producto   │
│  5. Click en "Confirmar Venta"      │
│  6. Seleccionar método de pago      │
│  7. Verificar ticket generado       │
└─────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────┐
│  Claude analiza resultados y        │
│  genera reporte con bugs            │
└─────────────────────────────────────┘
```

### 7.6 Modo de Operación Seguro

Para evitar caos y alucinaciones:

1. IA genera el test (plan de pasos)
2. IA **NO** ejecuta decisiones nuevas en runtime
3. Pilot ejecuta solo pasos definidos previamente
4. Si algo no coincide → **pausa y pide confirmación humana**

---

## 8. NQF Brain (Capa 4)

### 8.1 Definición

Motor de inteligencia central que diseña tests, encuentra edge cases, aprende de bugs anteriores y predice problemas.

### 8.2 Tecnologías

- Claude API con contexto persistente
- Vector DB para memoria semántica (Supabase pgvector)
- Embeddings para búsqueda de bugs similares
- Fine-tuning futuro

### 8.3 Estado Actual

🔴 **Conceptual** (Fase 4 del roadmap)

### 8.4 Outputs

- Test cases generados automáticamente
- Predicción de áreas de riesgo
- Priorización inteligente de tests
- Sugerencias de nuevos SLOs

### 8.5 Capacidades Planificadas

| Capacidad | Descripción |
|-----------|-------------|
| **Memoria de bugs** | Base de datos de bugs + cómo se resolvieron |
| **Generación de tests** | Dado un componente, sugiere tests relevantes |
| **Predicción de regresiones** | Al cambiar código, predice qué podría romperse |
| **Dashboard de salud** | Métricas de calidad en tiempo real |

### 8.6 Consultas Ejemplo

```
Usuario: "¿Tuvimos bugs de validación antes?"
Brain: "Sí, encontré 3 bugs relacionados:
        - BUG-0012: Validación de stock en ventas (resuelto)
        - BUG-0023: PIN acepta 1 dígito (resuelto)
        - BUG-0031: Precios negativos permitidos (pendiente)
        El patrón común es falta de validación en inputs numéricos."

Usuario: "Cambié el módulo de stock"
Brain: "Basado en el historial, te sugiero revisar:
        - Flujo de venta (depende de stock)
        - Dashboard (muestra métricas de stock)
        - Alertas de stock bajo
        Probabilidad de regresión: 67%"
```

---

## 9. Especificación Técnica del QA Agent v3

### 9.1 Arquitectura de Componentes

```
┌─────────────────────────────────────────────────────────────┐
│                      QA AGENT v3                             │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │  FRONTEND   │    │  BACKEND    │    │  STORAGE    │     │
│  │  (Browser)  │◄──►│  (Node.js)  │◄──►│  (SQLite)   │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│         │                  │                               │
│         │                  ▼                               │
│         │          ┌─────────────┐                         │
│         │          │ PLAYWRIGHT  │                         │
│         │          │  (Browser   │                         │
│         │          │  Control)   │                         │
│         │          └─────────────┘                         │
│         │                  │                               │
│         └──────────────────┼───────────────────────────────│
│                            ▼                               │
│                   ┌─────────────┐                          │
│                   │ CLAUDE API  │                          │
│                   │ (Anthropic) │                          │
│                   └─────────────┘                          │
│                                                            │
└─────────────────────────────────────────────────────────────┘
```

### 9.2 Componentes Detallados

| Componente | Tecnología | Responsabilidad |
|------------|------------|-----------------|
| **Frontend** | HTML + Tailwind + vanilla JS | UI, configuración, visualización |
| **Backend Local** | Node.js + Express | Ejecutar Playwright, manejar Chrome, API local |
| **IA Engine** | Claude API | Interpretar requests, generar tests, analizar resultados |
| **Storage** | SQLite local + Supabase (opcional) | Guardar historial, bugs, configuración |

### 9.3 Flujo de Ejecución Detallado

1. Usuario escribe request: "Probá el checkout con carrito vacío"
2. Frontend envía request a Backend local
3. Backend envía a Claude API con contexto del proyecto
4. Claude responde con plan de test estructurado (JSON)
5. Backend ejecuta el plan con Playwright
6. Playwright navega la app, captura screenshots/video
7. Backend envía resultados a Claude para análisis
8. Claude genera reporte final con bugs encontrados
9. Frontend muestra reporte + evidencia al usuario

### 9.4 Requerimientos Técnicos

**Para ejecutar QA Agent v3:**

| Requisito | Mínimo | Recomendado |
|-----------|--------|-------------|
| Node.js | 18.x | 20.x |
| RAM | 4 GB | 8 GB |
| Disco | 1 GB libre | 5 GB libre |
| Browser | Chrome/Chromium | Chrome 120+ |
| Red | 3 Mbps | 10 Mbps |

---

## 10. Seguridad y Anti-Alucinaciones

### 10.1 Principios de Seguridad

1. El agente **SOLO** puede acceder a URLs en whitelist configurada
2. Nunca almacena credenciales en texto plano
3. Videos/screenshots se guardan localmente, no se suben a terceros
4. API key de Claude encriptada o en variable de entorno
5. Backend local solo escucha en localhost (no expuesto a red)

### 10.2 Sandbox de Ejecución

```javascript
{
  "sandbox": {
    "allowed_domains": [
      "nordia-pos-real.vercel.app",
      "localhost:3000"
    ],
    "max_timeout_per_test": 60000,      // 60 segundos
    "max_actions_per_test": 100,
    "filesystem_access": false,
    "network_external": false
  }
}
```

### 10.3 Sistema Anti-Alucinaciones

**Problema:** Claude puede inventar bugs que no existen o métricas falsas.

**Soluciones implementadas:**

| Técnica | Implementación |
|---------|----------------|
| **Ground Truth Verification** | Todo lo que Claude diga se verifica contra evidencia real (screenshots, console logs). Si Claude dice "botón no funciona", debe haber screenshot que lo muestre. |
| **Confidence Scoring** | Claude indica nivel de confianza: 🔴 Bug confirmado (evidencia visual) vs 🟡 Bug probable (requiere verificación manual) |
| **Reproducibility Check** | Todo bug debe incluir pasos para reproducir ejecutables. Si no se puede reproducir automáticamente, se marca "No verificable automáticamente". |
| **Human in the Loop** | Bugs críticos requieren confirmación humana antes de crear GitHub Issues. Popup: "¿Confirmás que este bug es real?" |

### 10.4 Clasificación de Hallazgos

```
🔴 CONFIRMADO     = Evidencia visual/log que lo demuestra
🟡 PROBABLE       = Análisis sugiere problema, requiere verificación
⚪ NO VERIFICABLE = No se pudo confirmar automáticamente
```

---

# PARTE III: METODOLOGÍA QA

---

## 11. Matriz de Severidad y Prioridad

### 11.1 Niveles de Severidad (Impacto Técnico)

| Severidad | Emoji | Definición | Ejemplos |
|-----------|-------|------------|----------|
| **Crítica** | 🔴 | Sistema se bloquea, corrompe datos o impide cualquier operación. No existe workaround. | Crash al iniciar; venta que borra inventario; pérdida de totales de caja |
| **Alta** | 🟠 | Funcionalidad principal falla pero sistema sigue funcionando parcialmente. Workaround complejo. | No se puede cobrar con tarjeta (pero sí efectivo); balanza descalibrada; no imprime tickets |
| **Media** | 🟡 | Problema en funcionalidades secundarias. No impacta flujo principal. Se puede diferir. | Error en filtros de búsqueda; problema al exportar; lentitud en configuración |
| **Baja** | 🟢 | Defectos cosméticos o triviales. No afectan operativa ni percepción de fiabilidad. | Texto desalineado; icono incorrecto; tipografía inconsistente |

### 11.2 Niveles de Prioridad (Urgencia de Negocio)

| Prioridad | Definición | Acción |
|-----------|------------|--------|
| **Urgente** | Debe corregirse antes de cualquier release | Bloquea deploy |
| **Alta** | Se corrige en próxima iteración | Sprint actual |
| **Media** | Se planifica en backlog | Próximo sprint |
| **Baja** | Se corrige cuando haya disponibilidad | Icebox |

### 11.3 Matriz de Decisión

```
                    SEVERIDAD
                 Crítica  Alta  Media  Baja
              ┌────────┬──────┬──────┬──────┐
    Urgente   │ BLOCK  │ BLOCK│ HIGH │ MED  │
              ├────────┼──────┼──────┼──────┤
P   Alta      │ BLOCK  │ HIGH │ MED  │ LOW  │
R             ├────────┼──────┼──────┼──────┤
I   Media     │ HIGH   │ MED  │ LOW  │ LOW  │
O             ├────────┼──────┼──────┼──────┤
R   Baja      │ MED    │ LOW  │ LOW  │ ICE  │
              └────────┴──────┴──────┴──────┘

BLOCK = Bloquea release
HIGH  = Resolver antes de deploy
MED   = Backlog prioritario
LOW   = Backlog normal
ICE   = Icebox (cuando haya tiempo)
```

### 11.4 Regla de Oro

> **Cualquier bug Crítico o con prioridad Urgente BLOQUEA la liberación hasta ser resuelto o se documente un workaround aceptado por el Founder.**

---

## 12. Flujo de QA y Criterios de Salida

### 12.1 Flujo Completo

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   DISEÑO    │────▶│ DESARROLLO  │────▶│  ANALYZER   │
│             │     │             │     │  (Capa 1)   │
└─────────────┘     └─────────────┘     └─────────────┘
                                               │
                                               ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   DEPLOY    │◀────│  PRE-DEPLOY │◀────│  INSPECTOR  │
│             │     │             │     │  (Capa 2)   │
└─────────────┘     └─────────────┘     └─────────────┘
      │                    ▲                   │
      │                    │                   ▼
      │             ┌─────────────┐     ┌─────────────┐
      │             │   TESTING   │◀────│   PILOT     │
      │             │   MANUAL    │     │  (Capa 3)   │
      │             └─────────────┘     └─────────────┘
      │
      ▼
┌─────────────┐
│ POST-MORTEM │
│ & MEJORAS   │
└─────────────┘
```

### 12.2 Criterios de Salida por Fase

| Fase | Criterios de Salida |
|------|---------------------|
| **Diseño → Desarrollo** | Historias de usuario completas; criterios de aceptación definidos; flujos de verticales cubiertos |
| **Desarrollo → Analyzer** | Code review aprobado; pruebas unitarias ≥80% cobertura; sin errores de compilación |
| **Analyzer → Inspector** | Sin problemas de sanitización; sin injections; prompts dentro de límites; plantillas generadas |
| **Inspector → Pilot** | Tests automatizados pasan; sin errores de consola; sin network failures; tiempo de carga cumple SLO |
| **Pilot → Testing Manual** | Escenarios IA ejecutados sin bloqueos; validaciones de stock/totales correctas |
| **Testing Manual → Pre-deploy** | Smoke tests 100%; sin fallos críticos ni altos; resultados documentados |
| **Pre-deploy → Deploy** | Todos los bugs registrados; severidad/prioridad asignada; sin críticos/urgentes abiertos; contrato firmado |

### 12.3 Regla de No-Bypass

> **Si algún criterio no se cumple, se retorna a la fase anterior. No se permiten "bypass" sin justificación y aprobación explícita del Founder.**

---

## 13. Tipos de Testing

### 13.1 Smoke Test

| Aspecto | Definición |
|---------|------------|
| **Qué es** | Verificación rápida de que las funciones core funcionan |
| **Cuándo** | Antes de cada deploy |
| **Duración** | 15 minutos máximo |
| **Cobertura** | Solo happy paths críticos |
| **Ejecuta** | Automatizado + QA Lead |

### 13.2 Regression Test

| Aspecto | Definición |
|---------|------------|
| **Qué es** | Verificar que cambios no rompieron funcionalidad existente |
| **Cuándo** | Después de cambios significativos |
| **Duración** | 30-60 minutos |
| **Cobertura** | Todos los flujos principales |
| **Ejecuta** | Automatizado (Inspector + Pilot) |

### 13.3 Exploratory Test

| Aspecto | Definición |
|---------|------------|
| **Qué es** | Testing libre buscando bugs no anticipados |
| **Cuándo** | Antes de releases importantes |
| **Duración** | 1-2 horas |
| **Cobertura** | Donde la intuición lleve |
| **Ejecuta** | QA Lead (Gonzalo) |

### 13.4 Edge Case Test

| Aspecto | Definición |
|---------|------------|
| **Qué es** | Probar límites y casos extremos |
| **Cuándo** | Features nuevos |
| **Duración** | Variable |
| **Cobertura** | Inputs inválidos, límites, concurrencia |
| **Ejecuta** | QA Agent + QA Lead |

---

## 14. Las 3 Reglas Sagradas de QA Nordia

### Regla 1: Nada se deploya sin pasar los 10 Smoke Tests

```
┌─────────────────────────────────────────┐
│  🚫 SMOKE TEST FALLA = NO HAY DEPLOY    │
│                                          │
│  Esta lista es la Biblia del negocio.   │
│  Si falla 1 → NO deploy.                │
│  Sin excepciones.                        │
└─────────────────────────────────────────┘
```

### Regla 2: Cada bug debe tener 4 elementos obligatorios

```
┌─────────────────────────────────────────┐
│  TODO BUG REQUIERE:                      │
│                                          │
│  ✓ Pasos reproducibles                   │
│  ✓ Severidad asignada                    │
│  ✓ Evidencia visual                      │
│  ✓ Impacto en comercio real             │
│                                          │
│  Si falta alguno → BUG NO VÁLIDO        │
└─────────────────────────────────────────┘
```

### Regla 3: QA Agent SIEMPRE antes que QA Manual

```
┌─────────────────────────────────────────┐
│  ORDEN OBLIGATORIO:                      │
│                                          │
│  1️⃣ QA Agent → Análisis estático        │
│  2️⃣ QA Agent → Inspector dinámico       │
│  3️⃣ QA Manual → Solo flujos críticos    │
│                                          │
│  Nunca al revés. El agente primero.     │
└─────────────────────────────────────────┘
```

---

# PARTE IV: PLANTILLAS Y ARTEFACTOS

---

## 15. Plantilla JSON de Bug

### 15.1 Estructura Completa

```json
{
  "id": "BUG-0001",
  "title": "Error en cálculo de totales con descuento",
  "fecha": "2025-12-07",
  "reporter": "Gonzalo Haedo",
  
  "comercio": {
    "nombre": "Carnicería El Tío",
    "vertical": "carniceria",
    "dispositivo": "Tablet Samsung A7"
  },
  
  "clasificacion": {
    "severity": "Alta",
    "priority": "Urgente",
    "tipo": "Funcional",
    "componente": "POS/Checkout"
  },
  
  "descripcion": {
    "resumen": "El descuento se aplica dos veces al total",
    "steps_to_reproduce": [
      "Ingresar al POS con usuario cajero",
      "Agregar producto 'Costilla' con peso 2,5 kg",
      "Aplicar descuento manual de 10%",
      "Finalizar venta"
    ],
    "expected_result": "Total = (precio × peso) - 10% = $2.025",
    "actual_result": "Total = (precio × peso) - 20% = $1.800",
    "impact": "Pérdida de $225 por venta. Afecta margen de ganancia."
  },
  
  "evidencia": {
    "screenshot": "https://storage.nordia.uno/bugs/BUG-0001-screenshot.png",
    "video": "https://storage.nordia.uno/bugs/BUG-0001-video.mp4",
    "logs": "Error en consola: 'discount applied twice'",
    "network": null
  },
  
  "ambiente": {
    "app_version": "v1.3.0",
    "device": "Tablet Samsung A7",
    "os": "Android 11",
    "browser": "Chrome 120",
    "conexion": "WiFi 10 Mbps"
  },
  
  "tecnico": {
    "archivo_probable": "src/lib/calculations.ts",
    "linea_probable": 54,
    "notas_dev": "Revisar función calculateTotal(), parece que llama a applyDiscount() dos veces",
    "commit_relacionado": null
  },
  
  "estado": {
    "status": "Open",
    "asignado_a": null,
    "fecha_resolucion": null,
    "version_fix": null
  }
}
```

### 15.2 Guía de Uso

| Campo | Obligatorio | Notas |
|-------|-------------|-------|
| `id` | ✅ | Formato: BUG-XXXX |
| `title` | ✅ | Máximo 80 caracteres, descriptivo |
| `steps_to_reproduce` | ✅ | Detallados para que cualquiera replique |
| `severity` | ✅ | Crítica/Alta/Media/Baja |
| `priority` | ✅ | Urgente/Alta/Media/Baja |
| `impact` | ✅ | Por qué importa para el negocio |
| `evidencia` | ✅ | Al menos 1 screenshot o video |
| `notas_dev` | ⚪ | Opcional pero muy útil |

---

## 16. Plantilla JSON de Caso de Prueba

### 16.1 Estructura Completa

```json
{
  "id": "TC-0001",
  "title": "Venta simple con efectivo",
  "version": "1.0",
  "author": "Claude (QA Agent)",
  "last_updated": "2025-12-07",
  
  "metadata": {
    "objetivo": "Verificar que el POS permita registrar una venta simple con pago en efectivo",
    "severity_si_falla": "Alta",
    "priority": "Urgente",
    "tiempo_estimado": "3 minutos",
    "automatizable": true
  },
  
  "tags": [
    "smoke",
    "venta",
    "efectivo",
    "carniceria",
    "verduleria",
    "kiosco",
    "critico"
  ],
  
  "preconditions": [
    "Usuario autenticado con rol cajero",
    "Inventario con al menos un producto disponible",
    "Caja abierta para el turno actual"
  ],
  
  "steps": [
    {
      "numero": 1,
      "accion": "Navegar a la pantalla de ventas",
      "detalle": "Click en menú 'Vender' o ir a /app/sell",
      "expected": "Se muestra la pantalla de POS con buscador de productos"
    },
    {
      "numero": 2,
      "accion": "Buscar producto",
      "detalle": "Escribir nombre del producto o escanear código",
      "expected": "Producto aparece en resultados de búsqueda"
    },
    {
      "numero": 3,
      "accion": "Agregar al carrito",
      "detalle": "Click en producto y seleccionar cantidad (o peso si aplica)",
      "expected": "Producto aparece en carrito con precio correcto"
    },
    {
      "numero": 4,
      "accion": "Finalizar venta",
      "detalle": "Click en 'Confirmar Venta' o 'Cobrar'",
      "expected": "Se muestra selector de método de pago"
    },
    {
      "numero": 5,
      "accion": "Seleccionar pago efectivo",
      "detalle": "Click en 'Efectivo' e ingresar monto recibido",
      "expected": "Se calcula vuelto correctamente"
    },
    {
      "numero": 6,
      "accion": "Confirmar pago",
      "detalle": "Click en 'Confirmar' o 'Listo'",
      "expected": "Se genera ticket con número de operación"
    }
  ],
  
  "expected_results": [
    "Producto aparece en carrito con precio y cantidad correctos",
    "Total se calcula correctamente (precio × cantidad)",
    "Se genera ticket con número único de operación",
    "Stock se actualiza (cantidad disponible disminuye)",
    "Venta aparece en historial del día",
    "Dashboard actualiza métricas"
  ],
  
  "data_sets": {
    "productos_prueba": [
      {"nombre": "Costilla", "precio": 900, "unidad": "kg"},
      {"nombre": "Chorizo", "precio": 800, "unidad": "kg"},
      {"nombre": "Coca-Cola 500ml", "precio": 350, "unidad": "unidad"}
    ],
    "cantidades_prueba": [1, 2.5, 0.5, 10],
    "montos_efectivo": [1000, 5000, 10000]
  },
  
  "ambiente_requerido": {
    "app_version": ">=1.0.0",
    "dispositivos": ["desktop", "tablet", "mobile"],
    "browsers": ["Chrome 90+", "Firefox 88+", "Safari 14+"],
    "conexion": "Con y sin conexión (offline)"
  }
}
```

### 16.2 Guía de Uso

- `tags` facilitan filtrado por vertical, tipo de prueba, prioridad
- `preconditions` definen el estado necesario antes de ejecutar
- `data_sets` permiten ejecutar el mismo test con diferentes datos
- `expected_results` deben ser observables y verificables

---

## 17. QA Release Contract

### 17.1 Plantilla Completa

```markdown
# CONTRATO DE LIBERACIÓN - NORDIA POS

## Información de Release

| Campo | Valor |
|-------|-------|
| **Versión** | vX.X.X |
| **Fecha de build** | AAAA-MM-DD |
| **Fecha prevista deploy** | AAAA-MM-DD |
| **Tipo de release** | Feature / Hotfix / Maintenance |
| **Objetivo principal** | [Descripción breve] |

---

## Checklist de Calidad

### Desarrollo
| Criterio | Cumple | Evidencia |
|----------|--------|-----------|
| Historias de usuario completadas | ☐ Sí / ☐ No | |
| Code review aprobado | ☐ Sí / ☐ No | PR #___ |
| Tests unitarios (≥80% cobertura) | ☐ Sí / ☐ No | ___% |
| Sin errores de compilación | ☐ Sí / ☐ No | |

### QA Automatizado
| Criterio | Cumple | Evidencia |
|----------|--------|-----------|
| Analyzer sin hallazgos críticos | ☐ Sí / ☐ No | Reporte ___ |
| Inspector: tests dinámicos pasan | ☐ Sí / ☐ No | Reporte ___ |
| Pilot: escenarios IA ejecutados | ☐ Sí / ☐ No | Videos ___ |
| Performance: SLOs cumplidos | ☐ Sí / ☐ No | Métricas ___ |

### QA Manual
| Criterio | Cumple | Evidencia |
|----------|--------|-----------|
| 10 Smoke tests pasados (100%) | ☐ Sí / ☐ No | Checklist ___ |
| Checklists de vertical ejecutados | ☐ Sí / ☐ No | |
| Testing exploratorio completado | ☐ Sí / ☐ No | Notas ___ |

### Defectos
| Criterio | Cumple | Evidencia |
|----------|--------|-----------|
| Bugs críticos pendientes | ☐ 0 / ☐ ___ | |
| Bugs urgentes pendientes | ☐ 0 / ☐ ___ | |
| Bugs altos pendientes | ☐ ___ (aceptable) | |
| Todos los bugs documentados | ☐ Sí / ☐ No | |

### Documentación
| Criterio | Cumple | Evidencia |
|----------|--------|-----------|
| Release notes actualizadas | ☐ Sí / ☐ No | |
| Documentación técnica actualizada | ☐ Sí / ☐ No | |
| Changelog actualizado | ☐ Sí / ☐ No | |

---

## Métricas de Calidad

| Métrica | Objetivo | Actual | Estado |
|---------|----------|--------|--------|
| Cobertura de tests | ≥80% | ___% | ☐ OK / ☐ FAIL |
| Tiempo de carga (LCP) | <2.5s | ___s | ☐ OK / ☐ FAIL |
| Errores de consola | 0 | ___ | ☐ OK / ☐ FAIL |
| Defect escape rate | <5% | ___% | ☐ OK / ☐ FAIL |

---

## Riesgos Conocidos y Workarounds

| Riesgo | Severidad | Workaround | Aceptado por |
|--------|-----------|------------|--------------|
| | | | |

---

## Observaciones

[Incluir cualquier deuda técnica aceptada, limitaciones conocidas, o notas importantes]

---

## Firmas de Aprobación

| Rol | Nombre | Firma | Fecha |
|-----|--------|-------|-------|
| Director Técnico QA | Claude | __________ | ____-__-__ |
| Auditor Externo QA | ChatGPT | __________ | ____-__-__ |
| Founder & QA Lead | Gonzalo Haedo | __________ | ____-__-__ |

---

## Declaración

> La liberación de esta versión ha sido revisada y aprobada según los estándares
> definidos en el Nordia QA Standard v1.0. Todos los criterios de salida han sido
> cumplidos o las excepciones han sido documentadas y aceptadas.

**La liberación NO es válida sin todas las firmas.**
```

---

# PARTE V: TESTING OPERATIVO

---

## 18. Lista de Smoke Tests

### 18.1 Los 10 Tests Obligatorios

Estos tests se consideran **mínimos indispensables**. Cualquier build debe pasarlos al 100% antes de ser liberado.

| # | Test | Descripción | Severidad si falla |
|---|------|-------------|-------------------|
| **ST-01** | Inicio de sesión | Login con PIN válido e inválido; bloqueo tras intentos fallidos | 🔴 Crítica |
| **ST-02** | Venta simple (efectivo) | Agregar productos, calcular total, cobrar efectivo, actualizar stock | 🔴 Crítica |
| **ST-03** | Venta con balanza | Ingresar peso, calcular precio por kg, actualizar stock | 🔴 Crítica |
| **ST-04** | Venta con tarjeta | Método de pago tarjeta, manejo de aprobado/denegado | 🟠 Alta |
| **ST-05** | Anulación de venta | Anular ticket, revertir stock y totales | 🟠 Alta |
| **ST-06** | Corte de caja | Cierre de turno, cálculo por método de pago, diferencias | 🔴 Crítica |
| **ST-07** | Gestión de stock | Alta/edición de productos, ajuste de inventario, alertas | 🟠 Alta |
| **ST-08** | Actualización de precios | Cambiar precios, verificar en ventas posteriores | 🟠 Alta |
| **ST-09** | Reporte diario | Generación de reporte, filtros, exportación | 🟡 Media |
| **ST-10** | Recuperación tras caída | Simular corte de internet, reanudar sin pérdida de datos | 🔴 Crítica |

### 18.2 Criterio de Aprobación

```
┌─────────────────────────────────────────┐
│  SMOKE TESTS: CRITERIO DE APROBACIÓN    │
│                                          │
│  ✅ 10/10 pasan = APROBADO              │
│  ❌ 9/10 o menos = BLOQUEADO            │
│                                          │
│  No hay excepciones para Críticos.      │
│  Altos pueden tener workaround          │
│  documentado y aprobado por Founder.    │
└─────────────────────────────────────────┘
```

---

## 19. Escenarios Rápidos para QA Agent

### 19.1 Lista de 20 Escenarios

Estos son prompts predefinidos que el QA Agent puede ejecutar sin intervención humana.

| # | Escenario | Vertical | Tags |
|---|-----------|----------|------|
| 1 | Venta con balanza + efectivo | Carnicería | smoke, venta, peso |
| 2 | Venta con balanza + tarjeta | Carnicería | venta, peso, tarjeta |
| 3 | Venta con descuento manual | Todos | venta, descuento |
| 4 | Venta de combo promocional | Carnicería | venta, promo |
| 5 | Anulación parcial de venta | Todos | anulacion |
| 6 | Cambio de precio durante venta | Todos | precios, edge-case |
| 7 | Aplicación de impuesto adicional | Kiosco | impuestos |
| 8 | Fallo de conexión en medio de venta | Todos | offline, critico |
| 9 | Recuperación de venta offline | Todos | offline, sync |
| 10 | Corte de caja con diferencias | Todos | caja, critico |
| 11 | Ingreso de nuevo producto (carnicería) | Carnicería | stock, alta |
| 12 | Ingreso de nuevo producto (verdulería) | Verdulería | stock, alta |
| 13 | Recarga de celular | Kiosco | servicios |
| 14 | Venta con error en balanza | Carnicería | edge-case, hardware |
| 15 | Cierre de sesión y reapertura | Todos | auth |
| 16 | Exportación de reporte de ventas | Todos | reportes |
| 17 | Edición de inventario con múltiple unidad | Verdulería | stock, unidades |
| 18 | Promoción de último momento | Todos | promo, edge-case |
| 19 | Fallo en impresión de ticket | Todos | hardware, edge-case |
| 20 | Verificación de etiquetas sanitarias | Carnicería | compliance |

### 19.2 Formato de Ejecución

```bash
# Ejecutar escenario individual
qa run "Venta con balanza + efectivo"

# Ejecutar todos los de una vertical
qa run --vertical carniceria

# Ejecutar solo smoke tests
qa run --tag smoke

# Ejecutar cadena de escenarios
qa run --chain "1,2,3,10"
```

---

## 20. Checklists por Vertical

### 20.1 Carnicería 🥩

#### Tests Específicos

| # | Test | Criticidad |
|---|------|------------|
| C-01 | Productos por peso: calibración de balanza | 🔴 Crítica |
| C-02 | Conversión kg/g funciona correctamente | 🔴 Crítica |
| C-03 | Tolerancias de error de balanza configurables | 🟠 Alta |
| C-04 | Registro de merma (desperdicio, recortes) | 🟠 Alta |
| C-05 | Ajuste automático de stock por merma | 🟠 Alta |
| C-06 | Impresión de etiquetas con fecha de corte | 🟡 Media |
| C-07 | Impresión de etiquetas con vencimiento | 🟡 Media |
| C-08 | Promociones por combo (carne + achuras) | 🟡 Media |
| C-09 | Cálculo correcto de combos | 🟠 Alta |
| C-10 | Registro de temperatura de cámaras | 🟢 Baja |

#### Errores que NO pueden pasar

- ❌ Vender más kg de los que hay en stock
- ❌ Calcular mal el precio por peso
- ❌ Perder registro de merma
- ❌ No actualizar stock después de venta por peso

### 20.2 Verdulería 🥬

#### Tests Específicos

| # | Test | Criticidad |
|---|------|------------|
| V-01 | Productos mixtos (kg y unidad) en misma venta | 🔴 Crítica |
| V-02 | Precios por kg con decimales | 🔴 Crítica |
| V-03 | Alertas de productos próximos a vencer | 🟠 Alta |
| V-04 | Descuentos automáticos por vencimiento | 🟡 Media |
| V-05 | Registro de merma por daño/vencimiento | 🟠 Alta |
| V-06 | Seguimiento de desperdicio | 🟡 Media |
| V-07 | Variación de precios por temporada | 🟡 Media |
| V-08 | Reglas de precios por día (ofertas fin de semana) | 🟡 Media |
| V-09 | Recepción de partidas de proveedor | 🟠 Alta |
| V-10 | Actualización automática de stock por recepción | 🟠 Alta |

#### Errores que NO pueden pasar

- ❌ Mezclar unidades (kg vs unidad) en cálculos
- ❌ Vender producto vencido sin alerta
- ❌ No registrar recepción de mercadería

### 20.3 Kiosco 🏪

#### Tests Específicos

| # | Test | Criticidad |
|---|------|------------|
| K-01 | Venta rápida de productos unitarios | 🔴 Crítica |
| K-02 | Búsqueda rápida de productos frecuentes | 🟠 Alta |
| K-03 | Integración con recargas de celular | 🟠 Alta |
| K-04 | Confirmación de transacción de recarga | 🔴 Crítica |
| K-05 | Integración con recargas de transporte | 🟡 Media |
| K-06 | Control de stock de cigarrillos | 🟠 Alta |
| K-07 | Verificación de edad para productos restringidos | 🟠 Alta |
| K-08 | Promociones de golosinas (descuentos por cantidad) | 🟡 Media |
| K-09 | Regalos promocionales | 🟢 Baja |
| K-10 | Control de caja chica (gastos menores) | 🟡 Media |

#### Errores que NO pueden pasar

- ❌ Recarga de celular sin confirmación del proveedor
- ❌ Vender cigarrillos sin registro
- ❌ Perder gastos de caja chica

### 20.4 Tests Comunes a Todas las Verticales

| # | Test | Criticidad |
|---|------|------------|
| T-01 | Login con PIN funciona | 🔴 Crítica |
| T-02 | Agregar producto funciona | 🔴 Crítica |
| T-03 | Venta simple con efectivo funciona | 🔴 Crítica |
| T-04 | Dashboard muestra datos correctos | 🟠 Alta |
| T-05 | App funciona en móvil | 🔴 Crítica |
| T-06 | No hay errores en consola | 🟠 Alta |
| T-07 | Botones tienen tamaño mínimo 44px | 🟠 Alta |
| T-08 | Textos sin jerga técnica | 🟡 Media |
| T-09 | Feedback visual en acciones | 🟠 Alta |
| T-10 | Recuperación de datos offline | 🔴 Crítica |

---

# PARTE VI: MÉTRICAS Y KPIS

---

## 21. Indicadores de Confiabilidad

### 21.1 Definiciones (basadas en SRE y ISO 25010)

| Métrica | Definición | Fórmula |
|---------|------------|---------|
| **MTBF** | Mean Time Between Failures. Tiempo promedio entre fallas de un componente. | `Σ(tiempo_operativo) / número_fallas` |
| **MTTR** | Mean Time To Repair. Tiempo promedio para reparar desde que se detecta la falla. | `Σ(tiempo_reparación) / número_reparaciones` |
| **MTTD** | Mean Time To Detect. Tiempo promedio en detectar un incidente. | `Σ(tiempo_hasta_detección) / número_incidentes` |
| **MTTI** | Mean Time To Identify. Tiempo promedio para identificar la causa raíz. | `Σ(tiempo_hasta_identificación) / número_incidentes` |
| **MTRS** | Mean Time To Restore Service. Promedio de tiempo total para recuperar servicio completo. | `MTTD + MTTI + MTTR` |
| **MTBSI** | Mean Time Between Service Incidents. Promedio de horas entre incidentes. | `MTBF + MTRS` |

### 21.2 Objetivos para Nordia POS

| Métrica | Objetivo Q1 2026 | Objetivo Q2 2026 |
|---------|------------------|------------------|
| MTBF | ≥168 horas (1 semana) | ≥336 horas (2 semanas) |
| MTTR | ≤4 horas | ≤2 horas |
| MTTD | ≤30 minutos | ≤15 minutos |
| Disponibilidad | ≥99% | ≥99.5% |

---

## 22. Indicadores de Defectos

### 22.1 Métricas de Calidad de Software

| Métrica | Definición | Objetivo |
|---------|------------|----------|
| **Defect Density** | Defectos por cada 1000 líneas de código | ≤5 bugs/KLOC |
| **Defect Escape Rate** | % de defectos encontrados en producción vs QA | ≤5% |
| **Bug Fix Rate** | Bugs cerrados por sprint | ≥90% de críticos y altos |
| **Reopened Rate** | % de bugs que se reabren | ≤10% |
| **Test Coverage** | % de código cubierto por tests automatizados | ≥70% para críticos |

### 22.2 Fórmulas

```
Defect Density = (Total bugs encontrados / KLOC) × 1000

Defect Escape Rate = (Bugs en producción / Total bugs) × 100

Bug Fix Rate = (Bugs cerrados / Bugs asignados en sprint) × 100

Reopened Rate = (Bugs reabiertos / Bugs cerrados) × 100
```

---

## 23. SLOs y SLIs de Nordia POS

### 23.1 Definiciones

- **SLI** (Service Level Indicator): Métrica que mide el objetivo
- **SLO** (Service Level Objective): Objetivo numérico para el SLI
- **SLA** (Service Level Agreement): Acuerdo formal con consecuencias si no se cumple

### 23.2 SLOs de Nordia POS

| Área | SLO | SLI | Medición |
|------|-----|-----|----------|
| **Disponibilidad** | 99% uptime mensual | % de minutos operativos | Monitoreo automático |
| **Latencia - Carga** | <3s para vista de ventas en 95% de casos | Tiempo hasta interactivo | Lighthouse CI |
| **Latencia - Búsqueda** | <500ms para búsqueda de productos en 95% | Tiempo de respuesta | APM |
| **Latencia - Venta** | <2s para procesar venta en 95% | Tiempo desde click hasta confirmación | Logs |
| **Errores** | <1% de transacciones con error | % de requests con status 5xx | Logs de servidor |
| **Offline** | Sync exitoso en <5min al volver online | Tiempo hasta sincronización completa | Logs de cliente |

### 23.3 Ejemplo de Cálculo

```
SLO: 99% de disponibilidad mensual

Minutos en un mes = 30 × 24 × 60 = 43,200 minutos
Tiempo de inactividad permitido = 43,200 × 0.01 = 432 minutos = 7.2 horas

Si el sistema estuvo caído 5 horas en el mes:
Disponibilidad real = (43,200 - 300) / 43,200 = 99.3%
Estado: ✅ SLO cumplido
```

---

# PARTE VII: ROADMAP

---

## 24. Roadmap Quirúrgico

### 24.1 Visión General (5 Fases)

```
┌─────────────────────────────────────────────────────────────────┐
│                    ROADMAP NORDIA QUALITY FACTORY               │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  FASE 1          FASE 2          FASE 3          FASE 4         │
│  Fundamentos     QA Agent v3     NQF Pilot       NQF Brain      │
│  ────────────    ────────────    ────────────    ────────────   │
│  • Standard      • Playwright    • Tests IA      • Memoria      │
│  • Matrices      • Inspector     • Lang. Nat.    • Predicción   │
│  • Smoke Tests   • Métricas      • Videos        • Dashboard    │
│  • Checklists    • Screenshots   • Sandbox       • Aprendizaje  │
│                                                                  │
│                              ↓                                   │
│                                                                  │
│                          FASE 5                                  │
│                       Productización                             │
│                       ──────────────                             │
│                       • NQF como SaaS                            │
│                       • Documentación pública                    │
│                       • Certificación Nordia QA                  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 24.2 Detalle por Fase

#### FASE 1: Fundamentos

**Objetivo:** Tener la metodología y estándares documentados.

| Entregable | Descripción | Criterio de Éxito |
|------------|-------------|-------------------|
| F1.1 Nordia QA Standard v1.0 | Este documento | Cualquier persona puede leerlo y entender cómo hacer QA |
| F1.2 Matriz de Testing por Vertical | Checklists por carnicería, verdulería, kiosco | Selecciono vertical y tengo tests específicos |
| F1.3 Smoke Tests Documentados | Los 10 tests mínimos obligatorios | Puedo ejecutarlos en <15 minutos |
| F1.4 Plantillas JSON | Bug y Test Case templates | Todos los bugs/tests siguen el formato |
| F1.5 QA Release Contract | Documento de firma pre-deploy | Ningún deploy sin contrato firmado |

**Dependencias:** Ninguna

#### FASE 2: QA Agent v3.0 - El Salto

**Objetivo:** Evolucionar de análisis pasivo a inspección activa.

| Entregable | Descripción | Criterio de Éxito |
|------------|-------------|-------------------|
| F2.1 Backend Node.js | Servidor local para ejecutar Playwright | `npm start` levanta el servicio |
| F2.2 Integración Playwright | Browser automation configurado | Puede abrir la app y navegar |
| F2.3 Captura de Evidencia | Screenshots, videos, console logs | Cada test genera evidencia automática |
| F2.4 Métricas de Performance | Lighthouse CI integrado | Reporte incluye FCP, LCP, TTI medidos |
| F2.5 Detección de Errores Runtime | Captura de console.error y network failures | Errores aparecen en el reporte |

**Dependencias:** F1.1, F1.3

#### FASE 3: NQF Pilot - Testing Interactivo

**Objetivo:** El sistema ejecuta flujos de usuario completos.

| Entregable | Descripción | Criterio de Éxito |
|------------|-------------|-------------------|
| F3.1 Flujos Predefinidos Ejecutables | Scripts Playwright para flujos críticos | Click en "Ejecutar Venta" corre el test |
| F3.2 Lenguaje Natural a Tests | Describir test en español, se ejecuta | "Probá agregar producto sin precio" funciona |
| F3.3 Reporte con Video + Pasos | Cada test genera video y lista de acciones | Puedo ver exactamente qué hizo el test |
| F3.4 Modo Exploración | El agente navega libremente buscando bugs | Encuentra bugs que no anticipé |

**Dependencias:** F2.1, F2.2

#### FASE 4: NQF Brain - Inteligencia Central

**Objetivo:** El sistema aprende, predice y mejora solo.

| Entregable | Descripción | Criterio de Éxito |
|------------|-------------|-------------------|
| F4.1 Memoria de Bugs | BD de bugs + resoluciones con búsqueda semántica | "¿Tuvimos bugs de validación?" responde con contexto |
| F4.2 Generación Automática de Tests | Dado un componente, sugiere tests | Subo componente, genera 5 test cases |
| F4.3 Predicción de Regresiones | Al cambiar código, predice qué revisar | Cambio stock, sugiere revisar ventas |
| F4.4 Dashboard de Salud | Métricas de calidad en tiempo real | Abro dashboard, veo estado actual |

**Dependencias:** F3.1, F3.2

#### FASE 5: Productización

**Objetivo:** Convertir NQF en producto vendible.

| Entregable | Descripción | Criterio de Éxito |
|------------|-------------|-------------------|
| F5.1 NQF como SaaS | Otros equipos pueden usar NQF | 1 equipo externo usando NQF |
| F5.2 Documentación Pública | Docs estilo Stripe/Vercel | Alguien integra NQF sin ayuda |
| F5.3 Certificación Nordia QA | Badge para proyectos que pasen estándares | Un proyecto tiene badge "Certificado por Nordia QA" |

**Dependencias:** F4.4

---

## 25. Criterios de Éxito por Fase

### 25.1 Checklist de Completitud

#### Fase 1 Completa cuando:

- [ ] Nordia QA Standard v1.0 publicado en repo
- [ ] Todos los roles entienden la matriz de severidad
- [ ] 10 Smoke Tests documentados y ejecutables
- [ ] Plantillas JSON en uso para todos los bugs nuevos
- [ ] Primer QA Release Contract firmado

#### Fase 2 Completa cuando:

- [ ] Backend Node.js corriendo en máquina de Gonzalo
- [ ] Playwright ejecuta los 10 Smoke Tests automáticamente
- [ ] Cada test genera screenshot y log de consola
- [ ] Lighthouse CI mide métricas reales
- [ ] Al menos 1 bug encontrado automáticamente que no vimos manualmente

#### Fase 3 Completa cuando:

- [ ] Puedo escribir "Probá venta con carrito vacío" y se ejecuta
- [ ] Tests generan video reproducible
- [ ] Modo exploración encontró al menos 1 bug nuevo
- [ ] 20 escenarios rápidos funcionando

#### Fase 4 Completa cuando:

- [ ] Puedo preguntar "¿bugs similares a este?" y responde con contexto
- [ ] Al cambiar código, recibo sugerencias de qué testear
- [ ] Dashboard muestra métricas actualizadas diariamente
- [ ] Predicción de regresiones tiene ≥60% de acierto

#### Fase 5 Completa cuando:

- [ ] 1 equipo externo pagando o usando NQF
- [ ] Documentación permite onboarding sin ayuda
- [ ] Al menos 1 proyecto con certificación Nordia QA

---

# ANEXOS

---

## Anexo A: Contexto de Nordia POS

### A.1 Información del Producto

| Campo | Valor |
|-------|-------|
| **Nombre** | Nordia POS |
| **Tipo** | Sistema de Punto de Venta (PWA) |
| **Stack** | Next.js 16 + Supabase + Zustand + Tailwind CSS |
| **Target** | Comercios de barrio en Argentina |

### A.2 URLs

| Ambiente | URL |
|----------|-----|
| Producción | https://nordia-pos-real.vercel.app |
| Landing | https://nordia.uno/pos |
| Onboarding | https://nordia-pos-real.vercel.app/onboarding |
| Repositorio | https://github.com/gonzacha/nordia-pos |

### A.3 Verticales Soportadas

1. Carnicería 🥩
2. Verdulería 🥬
3. Panadería 🥖
4. Kiosco 🏪
5. Almacén 🍺
6. Cosmética 💄
7. Indumentaria 👗
8. Ferretería 🔧
9. Genérico

### A.4 Perfil del Usuario Target

| Característica | Valor |
|----------------|-------|
| Edad | 35-65 años |
| Nivel digital | Bajo a medio |
| Dispositivo típico | Android gama baja/media (Moto G, Samsung A, Xiaomi Redmi) |
| RAM típica | 2-4 GB |
| Conexión | 3-10 Mbps, frecuentemente inestable |
| Pantalla | Posiblemente rota, sucia o con protector viejo |
| Ambiente | Luz variable, a veces sol directo |

### A.5 Misión de Nordia

> **"No hacemos el POS más moderno. Hacemos el primer sistema de ventas para quienes nunca tuvieron uno."**

---

## Anexo B: Glosario de Términos

| Término | Definición |
|---------|------------|
| **Bug** | Defecto en el software que causa comportamiento no esperado |
| **Edge case** | Caso límite o extremo que puede causar fallas |
| **E2E** | End-to-End testing, pruebas de flujo completo |
| **Gate** | Punto de control que debe aprobarse antes de continuar |
| **Happy path** | Flujo ideal sin errores ni casos especiales |
| **Hotfix** | Corrección urgente de un bug en producción |
| **MVP** | Minimum Viable Product, producto mínimo viable |
| **PWA** | Progressive Web App, aplicación web progresiva |
| **QA** | Quality Assurance, aseguramiento de calidad |
| **Regression** | Bug introducido por un cambio en código existente |
| **SLA** | Service Level Agreement, acuerdo de nivel de servicio |
| **SLI** | Service Level Indicator, indicador de nivel de servicio |
| **SLO** | Service Level Objective, objetivo de nivel de servicio |
| **Smoke test** | Prueba rápida de funcionalidades básicas |
| **Sprint** | Período de desarrollo (típicamente 1-2 semanas) |
| **Workaround** | Solución temporal a un problema |

---

## Anexo C: Referencias

### C.1 Estándares y Frameworks

1. **ISO/IEC 25010:2011** - Systems and software Quality Requirements and Evaluation (SQuaRE)
   - https://iso25000.com/index.php/en/iso-25000-standards/iso-25010

2. **Google SRE Book** - Site Reliability Engineering
   - https://sre.google/sre-book/table-of-contents/

3. **Testing Pyramid** - Martin Fowler
   - https://martinfowler.com/articles/practical-test-pyramid.html

### C.2 Herramientas

1. **Playwright** - Browser automation
   - https://playwright.dev/

2. **Lighthouse** - Performance metrics
   - https://developer.chrome.com/docs/lighthouse/

3. **Anthropic Claude API** - AI engine
   - https://docs.anthropic.com/

4. **Supabase** - Backend as a Service
   - https://supabase.com/docs

### C.3 Artículos Consultados

1. "Bug Severity Guide: Understanding the Criticality of Software Defects"
   - https://dev.to/morrismoses149/bug-severity-guide-understanding-the-criticality-of-software-defects-2e64

2. "SLOs, SLIs, and SLAs: Meanings & Differences"
   - https://newrelic.com/blog/best-practices/what-are-slos-slis-slas

3. "What's the difference between MTTR, MTBF, MTTD, and MTTF"
   - https://www.logicmonitor.com/blog/whats-the-difference-between-mttr-mttd-mttf-and-mtbf

---

# FIN DEL DOCUMENTO

---

**Nordia Quality Factory v1.0**
**Documento Fundacional de Calidad de Software**

*"La calidad no es un afterthought. Es una ventaja competitiva."*

---

© 2025 Nordia Technologies. Corrientes, Argentina.
Todos los derechos reservados.
