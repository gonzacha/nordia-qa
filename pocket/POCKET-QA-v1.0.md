# 🧾 NORDIA QUALITY FACTORY – POCKET QA v1.0

**Usar SIEMPRE antes de pensar en deploy.**
Basado en: *Nordia Quality Factory – Manual Completo v1.0*.

---

## 1️⃣ Roles clave

| Rol                     | Nombre   | Qué decide                                       |
| ----------------------- | -------- | ------------------------------------------------ |
| **Founder & QA Lead**   | Gonza    | Prioridad de bugs, go/no-go de releases          |
| **Director Técnico QA** | Claude   | Arquitectura QA, automatización, calidad técnica |
| **Auditor Externo QA**  | ChatGPT  | Estándares, metodología, segunda opinión         |
| **Dev Team**            | (Nordia) | Implementación, fixes, tests unitarios           |

---

## 2️⃣ Flujo de QA (gates obligatorios)

**Secuencia mínima por release:**

```
Diseño → Desarrollo → Analyzer → Inspector → Pilot → Testing Manual → Pre-deploy → Deploy
```

1. **Diseño → Desarrollo**
   - Historias claras + criterios de aceptación.

2. **Desarrollo → Analyzer (Capa 1)**
   - Code review OK
   - Tests unitarios razonables
   - Build sin errores.

3. **Analyzer → Inspector (Capa 2)**
   - Sin hallazgos críticos en análisis estático.
   - Inputs sanitizados / sin cosas explosivas.

4. **Inspector → Pilot (Capa 3)**
   - Tests dinámicos básicos pasan (sin errores de consola / network).
   - Tiempos de carga dentro de lo aceptable.

5. **Pilot → Testing Manual**
   - Flujos clave ejecutados por el agente (venta, stock, caja).

6. **Testing Manual → Pre-deploy**
   - **10 Smoke Tests = 100% OK.**
   - Sin bugs Críticos o Urgentes abiertos.

7. **Pre-deploy → Deploy**
   - **QA Release Contract** completado.
   - Firmas: Claude + ChatGPT + Gonza.

> 🔴 Si un gate no se cumple → se vuelve para atrás. No hay bypass "por las dudas".

---

## 3️⃣ Las 3 Reglas Sagradas

### Regla 1
**Nada se deploya sin pasar los 10 Smoke Tests.**

### Regla 2
**Todo bug debe tener:**
- pasos reproducibles
- severidad
- evidencia
- impacto en comercio real

→ Si falta algo → *bug NO válido*.

### Regla 3
**Orden obligatorio:**
1. QA Agent (análisis estático + dinámico)
2. Después QA manual (flujos críticos)

---

## 4️⃣ Severidad y prioridad (decisión rápida)

### Severidad (impacto):

| Emoji | Nivel | Significado |
|-------|-------|-------------|
| 🔴 | **Crítica** | No se puede trabajar / se pierden datos o plata |
| 🟠 | **Alta** | Función clave rota, hay workaround feo |
| 🟡 | **Media** | Duele pero se puede convivir |
| 🟢 | **Baja** | Cosmético / comodidad |

### Regla simple:

- **Crítica + Urgente** → Bloquea deploy sí o sí
- **Alta + Urgente** → Se arregla antes del deploy o se documenta workaround aceptado por Gonza

---

## 5️⃣ Los 10 Smoke Tests Obligatorios

Antes de cada release, **todos deben pasar**:

| # | Test | Qué valida |
|---|------|------------|
| **ST-01** | Login con PIN | válido / inválido / bloqueo por intentos |
| **ST-02** | Venta simple con efectivo | total + stock |
| **ST-03** | Venta con balanza | precio × peso + stock |
| **ST-04** | Venta con tarjeta | aprobado / denegado |
| **ST-05** | Anulación de venta | stock y totales vuelven bien |
| **ST-06** | Corte de caja | totales por método y diferencias |
| **ST-07** | Gestión de stock | alta / edición / ajuste |
| **ST-08** | Cambio de precios | se refleja en nuevas ventas |
| **ST-09** | Reporte diario | se genera y filtra OK |
| **ST-10** | Caída y recuperación | corte de internet, datos intactos |

```
✅ 10/10 OK = se puede seguir
❌ 9/10 o menos = NO hay deploy
```

---

## 6️⃣ Mini-checklist antes de decir "Deploy"

Marcar mentalmente o en papel:

- [ ] ¿Pasaron los 10 Smoke Tests?
- [ ] ¿No hay bugs Críticos ni Urgentes abiertos?
- [ ] ¿Hay evidencia (screenshots / video / logs) de los hallazgos importantes?
- [ ] ¿El QA Agent corrió al menos una vez sobre la versión actual?
- [ ] ¿El QA Release Contract está completo y firmado?

> Si alguna es **NO** → no es un release, es un **candidato a release**.

---

## 📌 Referencia rápida

| Documento | Ubicación |
|-----------|-----------|
| Manual Completo | `qa/NORDIA-QUALITY-FACTORY-MANUAL-v1.0.md` |
| Plantilla Bug | `qa/BUG-TEMPLATE.json` |
| Plantilla Test | `qa/TESTCASE-TEMPLATE.json` |
| Release Contract | `qa/QA-RELEASE-CONTRACT.md` |

---

*Nordia Quality Factory v1.0 — Pocket QA*
*© 2025 Nordia Technologies. Corrientes, Argentina.*
