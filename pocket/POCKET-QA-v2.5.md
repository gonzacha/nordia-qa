# 🧾 NORDIA QUALITY FACTORY – POCKET QA v2.5

**Versión:** 2.5 | **Fecha:** 2025-12-07 | **Estado:** Activo

> *"Usar SIEMPRE antes de pensar en deploy."*

---

## 📌 Quick Reference

| Recurso | Ubicación |
|---------|-----------|
| Manual Completo | `manual/NORDIA-QUALITY-FACTORY-MANUAL-v1.0.md` |
| QA Agent | `agent/nordia-qa-agent.html` |
| Bug Template | `templates/BUG-TEMPLATE.json` |
| Release Contract | `templates/QA-RELEASE-CONTRACT.md` |

---

## 1️⃣ ROLES Y CONTACTOS

| Rol | Nombre | Responsabilidad | Escalar cuando... |
|-----|--------|-----------------|-------------------|
| **Founder & QA Lead** | Gonza | Go/No-go final, prioridades | Bug crítico, decisión de negocio |
| **Director Técnico QA** | Claude | Arquitectura, automatización | Problema técnico complejo |
| **Auditor Externo QA** | ChatGPT | Metodología, estándares | Duda de proceso, segunda opinión |
| **Dev Team** | Nordia | Implementación, fixes | - |

### Cómo escalar un bug crítico:
1. Documentar con plantilla JSON
2. Notificar a Gonza inmediatamente
3. Bloquear deploy hasta resolución

---

## 2️⃣ FLUJO DE QA (GATES)

```
┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐
│  DISEÑO  │──▶│DESARROLLO│──▶│ ANALYZER │──▶│INSPECTOR │
└──────────┘   └──────────┘   └──────────┘   └──────────┘
                                                   │
┌──────────┐   ┌──────────┐   ┌──────────┐         │
│  DEPLOY  │◀──│PRE-DEPLOY│◀──│ TESTING  │◀────────┘
└──────────┘   └──────────┘   │  MANUAL  │
     │                        └──────────┘
     ▼
┌──────────┐
│  POST-   │
│  DEPLOY  │
└──────────┘
```

### Criterios por Gate:

| Gate | ✅ Pasa si... | 🚫 Bloquea si... |
|------|--------------|------------------|
| **Diseño → Dev** | Criterios de aceptación claros | Sin historias definidas |
| **Dev → Analyzer** | Build sin errores, code review OK | Errores de compilación |
| **Analyzer → Inspector** | Sin hallazgos críticos | Sanitización faltante |
| **Inspector → Testing** | Tests dinámicos pasan | Errores de consola |
| **Testing → Pre-deploy** | 10 Smoke Tests OK | Cualquier smoke falla |
| **Pre-deploy → Deploy** | Contract firmado, 0 críticos | Bugs críticos abiertos |

> 🔴 **Si un gate no se cumple → se vuelve para atrás. Sin excepciones.**

---

## 3️⃣ LAS 3 REGLAS SAGRADAS

### 📛 REGLA 1: Los 10 Smoke Tests
```
Nada se deploya sin pasar los 10 Smoke Tests.
10/10 = ✅ Deploy
9/10 o menos = 🚫 NO Deploy
```

### 📝 REGLA 2: Todo bug requiere 4 elementos
```
☐ Pasos reproducibles
☐ Severidad asignada
☐ Evidencia visual (screenshot/video)
☐ Impacto en comercio real

Falta 1 = Bug NO válido
```

### 🤖 REGLA 3: Orden obligatorio
```
1° QA Agent (estático + dinámico)
2° QA Manual (flujos críticos)

Nunca al revés.
```

---

## 4️⃣ SEVERIDAD Y PRIORIDAD

### Matriz de Severidad:

| Emoji | Nivel | Definición | Ejemplo Nordia POS |
|-------|-------|------------|-------------------|
| 🔴 | **Crítica** | No se puede trabajar / pérdida de datos | Venta no registra, caja se borra |
| 🟠 | **Alta** | Función clave rota, workaround feo | Tarjeta no funciona (pero efectivo sí) |
| 🟡 | **Media** | Duele pero se puede convivir | Filtros de búsqueda lentos |
| 🟢 | **Baja** | Cosmético | Texto desalineado |

### Decisión Rápida:

```
¿Bloquea venta?     → 🔴 Crítica
¿Afecta dinero?     → 🔴 Crítica  
¿Función rota?      → 🟠 Alta
¿Molesta pero anda? → 🟡 Media
¿Solo visual?       → 🟢 Baja
```

### Acción por Severidad:

| Severidad | Acción | Timeline |
|-----------|--------|----------|
| 🔴 Crítica | **BLOQUEA DEPLOY** | Inmediato |
| 🟠 Alta | Resolver antes de deploy | < 24h |
| 🟡 Media | Backlog prioritario | Próximo sprint |
| 🟢 Baja | Cuando haya tiempo | Icebox |

---

## 5️⃣ LOS 10 SMOKE TESTS

### Tests Obligatorios (100% requerido):

| # | Test | Valida | Sev. si falla |
|---|------|--------|---------------|
| **ST-01** | Login con PIN | Auth funciona | 🔴 |
| **ST-02** | Venta simple (efectivo) | Core del negocio | 🔴 |
| **ST-03** | Venta con balanza | Peso → precio | 🔴 |
| **ST-04** | Venta con tarjeta | Método de pago | 🟠 |
| **ST-05** | Anulación de venta | Reversión correcta | 🟠 |
| **ST-06** | Corte de caja | Cierre de turno | 🔴 |
| **ST-07** | Gestión de stock | CRUD productos | 🟠 |
| **ST-08** | Cambio de precios | Se refleja en ventas | 🟠 |
| **ST-09** | Reporte diario | Exportación | 🟡 |
| **ST-10** | Recuperación offline | Datos intactos | 🔴 |

### Ejecución:
```bash
# Con QA Agent (cuando esté v3):
qa run --smoke

# Manual (ahora):
Abrir POS → Ejecutar cada test → Documentar resultado
```

---

## 6️⃣ TESTS POR VERTICAL

### 🥩 Carnicería (5 críticos):

| Test | Valida |
|------|--------|
| Venta por kg | Peso × precio correcto |
| Stock por peso | Se descuenta bien |
| Merma | Se registra |
| Balanza | Calibrada |
| Combos | Carne + achuras |

**❌ NO puede pasar:**
- Vender más kg de los que hay
- Calcular mal precio por peso
- Perder registro de merma

### 🥬 Verdulería (5 críticos):

| Test | Valida |
|------|--------|
| Mixto kg/unidad | En misma venta |
| Vencimiento | Alerta funciona |
| Descuento auto | Por próximo a vencer |
| Recepción | Stock actualiza |
| Merma | Por daño/vencido |

**❌ NO puede pasar:**
- Mezclar unidades en cálculos
- Vender vencido sin alerta

### 🏪 Kiosco (5 críticos):

| Test | Valida |
|------|--------|
| Venta rápida | Unitarios ágil |
| Recarga celular | Confirmación OK |
| Stock cigarrillos | Control legal |
| Caja chica | Gastos menores |
| Promociones | Descuentos cantidad |

**❌ NO puede pasar:**
- Recarga sin confirmación del proveedor
- Perder gastos de caja chica

---

## 7️⃣ MÉTRICAS CLAVE

### Objetivos Q1 2026:

| Métrica | Target | Cómo medir |
|---------|--------|------------|
| **MTBF** | ≥168h (1 semana) | Tiempo entre fallas |
| **MTTR** | ≤4h | Tiempo para reparar |
| **Disponibilidad** | ≥99% | Uptime mensual |
| **Escape Rate** | ≤5% | Bugs en prod vs QA |

### SLOs de Nordia POS:

| Área | Objetivo |
|------|----------|
| Carga inicial | <3s en 95% |
| Búsqueda productos | <500ms en 95% |
| Procesar venta | <2s en 95% |
| Errores | <1% transacciones |

---

## 8️⃣ CHECKLIST PRE-DEPLOY

```
☐ 10 Smoke Tests pasaron (100%)
☐ 0 bugs Críticos abiertos
☐ 0 bugs Urgentes abiertos
☐ QA Agent ejecutado en esta versión
☐ Evidencia guardada (screenshots/videos)
☐ CHANGELOG actualizado
☐ QA Release Contract firmado
```

**Si falta 1 → NO es release, es candidato.**

---

## 9️⃣ CHECKLIST POST-DEPLOY

```
☐ Smoke test en producción (ST-01, ST-02, ST-06)
☐ Monitorear errores 30 minutos
☐ Verificar métricas de carga
☐ Notificar al equipo
☐ Documentar cualquier issue nuevo
```

**Si hay problema crítico → Rollback inmediato**

---

## 🔟 QA RELEASE CONTRACT (Resumen)

Antes de cada deploy, completar:

```markdown
## Release vX.X.X - [Fecha]

### Firmas requeridas:
- [ ] Director Técnico QA (Claude): ________
- [ ] Auditor Externo QA (ChatGPT): ________
- [ ] Founder & QA Lead (Gonza): ________

### Confirmaciones:
- [ ] Smoke Tests: 10/10
- [ ] Bugs críticos: 0
- [ ] Contract completo: Sí

### Notas:
[Cualquier riesgo conocido o workaround]
```

**Sin las 3 firmas → NO hay deploy.**

---

## 📞 ESCALAMIENTO RÁPIDO

| Situación | Acción | Contactar |
|-----------|--------|-----------|
| Bug crítico en prod | Rollback, documentar | Gonza + Claude |
| Duda de severidad | Consultar matriz | ChatGPT |
| Problema técnico | Investigar root cause | Claude |
| Decisión de negocio | Esperar aprobación | Gonza |
| Comercio reporta error | Priorizar, documentar | Gonza |

---

## 🔗 Links Rápidos

| Recurso | URL |
|---------|-----|
| Nordia POS (prod) | https://nordia-pos-real.vercel.app |
| Landing | https://nordia.uno/pos |
| Repo POS | github.com/gonzacha/nordia-pos |
| Repo QA | github.com/gonzacha/nordia-qa |

---

<div align="center">

**NORDIA QUALITY FACTORY v2.5**

*Pocket QA - Para pegar en la pared*

🇦🇷 Hecho en Corrientes

</div>
