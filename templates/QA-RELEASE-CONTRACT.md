# 📋 QA RELEASE CONTRACT

## Nordia Quality Factory - Contrato de Liberación

---

## 📌 Información del Release

| Campo | Valor |
|-------|-------|
| **Versión** | vX.X.X |
| **Fecha de build** | YYYY-MM-DD |
| **Fecha prevista deploy** | YYYY-MM-DD |
| **Tipo de release** | [ ] Feature / [ ] Hotfix / [ ] Maintenance |
| **Objetivo principal** | [Descripción breve] |
| **Branch** | [nombre-del-branch] |
| **Commit** | [hash-del-commit] |

---

## ✅ Checklist de Desarrollo

| Criterio | Cumple | Evidencia |
|----------|:------:|-----------|
| Historias de usuario completadas | ☐ | |
| Code review aprobado | ☐ | PR #___ |
| Tests unitarios pasan | ☐ | ___% cobertura |
| Build sin errores | ☐ | |
| Sin warnings críticos | ☐ | |

---

## 🤖 Checklist QA Automatizado

| Criterio | Cumple | Evidencia |
|----------|:------:|-----------|
| Analyzer ejecutado sin críticos | ☐ | Reporte: ___ |
| Inspector: tests dinámicos pasan | ☐ | Reporte: ___ |
| Performance: SLOs cumplidos | ☐ | LCP: ___s |
| Sin errores de consola | ☐ | |
| Sin network failures | ☐ | |

---

## 🧪 Checklist QA Manual

| Criterio | Cumple | Evidencia |
|----------|:------:|-----------|
| **ST-01** Login con PIN | ☐ | |
| **ST-02** Venta simple (efectivo) | ☐ | |
| **ST-03** Venta con balanza | ☐ | |
| **ST-04** Venta con tarjeta | ☐ | |
| **ST-05** Anulación de venta | ☐ | |
| **ST-06** Corte de caja | ☐ | |
| **ST-07** Gestión de stock | ☐ | |
| **ST-08** Cambio de precios | ☐ | |
| **ST-09** Reporte diario | ☐ | |
| **ST-10** Recuperación offline | ☐ | |

**Resultado Smoke Tests:** ___/10

---

## 🐛 Estado de Defectos

| Severidad | Abiertos | Resueltos | Pendientes |
|-----------|:--------:|:---------:|:----------:|
| 🔴 Críticos | | | |
| 🟠 Altos | | | |
| 🟡 Medios | | | |
| 🟢 Bajos | | | |

**¿Hay bugs críticos abiertos?** [ ] No / [ ] Sí → 🚫 BLOQUEA RELEASE

**¿Hay bugs urgentes abiertos?** [ ] No / [ ] Sí (con workaround documentado)

---

## 📊 Métricas de Calidad

| Métrica | Objetivo | Actual | Estado |
|---------|:--------:|:------:|:------:|
| Cobertura tests | ≥80% | ___% | ☐ OK / ☐ FAIL |
| Tiempo de carga (LCP) | <2.5s | ___s | ☐ OK / ☐ FAIL |
| Errores consola | 0 | ___ | ☐ OK / ☐ FAIL |
| Defect escape rate | <5% | ___% | ☐ OK / ☐ FAIL |

---

## ⚠️ Riesgos Conocidos

| Riesgo | Severidad | Workaround | Aceptado por |
|--------|:---------:|------------|:------------:|
| | | | |
| | | | |

---

## 📝 Observaciones

```
[Incluir cualquier deuda técnica aceptada, limitaciones conocidas, 
features parciales, o notas importantes para el equipo]




```

---

## 📋 Documentación

| Documento | Actualizado | Link |
|-----------|:-----------:|------|
| CHANGELOG.md | ☐ | |
| README.md | ☐ | |
| Release notes | ☐ | |

---

## ✍️ Firmas de Aprobación

### Director Técnico QA (Claude)

```
Confirmo que los aspectos técnicos de este release han sido verificados
según los estándares de Nordia Quality Factory.

Firma: _______________________
Fecha: _______________________
```

### Auditor Externo QA (ChatGPT)

```
Confirmo que la metodología y estándares de QA han sido aplicados
correctamente en este release.

Firma: _______________________
Fecha: _______________________
```

### Founder & QA Lead (Gonzalo Haedo)

```
Apruebo la liberación de esta versión a producción.
Asumo la responsabilidad final sobre esta decisión.

Firma: _______________________
Fecha: _______________________
```

---

## 🚦 Decisión Final

| Estado | Seleccionar |
|--------|:-----------:|
| ✅ **APROBADO PARA DEPLOY** | ☐ |
| ⏸️ **APROBADO CON CONDICIONES** | ☐ |
| 🚫 **RECHAZADO - NO DEPLOY** | ☐ |

**Condiciones (si aplica):**
```


```

---

## 📅 Post-Deploy

**Fecha/hora de deploy:** _______________

**Responsable del deploy:** _______________

**Checklist post-deploy:**
- [ ] Smoke test en producción (ST-01, ST-02, ST-06)
- [ ] Monitoreo 30 minutos sin errores
- [ ] Métricas de carga normales
- [ ] Equipo notificado
- [ ] Issues nuevos documentados

**¿Rollback necesario?** [ ] No / [ ] Sí → Versión: ___

---

<div align="center">

**NORDIA QUALITY FACTORY**

*Este contrato es obligatorio para todo release a producción.*

*Sin las 3 firmas, NO hay deploy.*

</div>
