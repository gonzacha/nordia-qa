# 🧪 SMOKE TESTS - Nordia POS

## Los 10 Tests Obligatorios

> **Regla:** 10/10 = Deploy ✅ | 9/10 o menos = NO Deploy 🚫

---

## ST-01: Login con PIN 🔴

**Severidad si falla:** Crítica

### Pasos:
1. Abrir la app en `/` o `/login`
2. Ingresar PIN válido (4-6 dígitos)
3. Verificar acceso al dashboard
4. Cerrar sesión
5. Ingresar PIN inválido 3 veces
6. Verificar bloqueo temporal

### Expected:
- [ ] PIN válido → Acceso OK
- [ ] PIN inválido → Mensaje de error claro
- [ ] 3 intentos fallidos → Bloqueo temporal
- [ ] No hay errores en consola

### Notas:
```


```

---

## ST-02: Venta Simple con Efectivo 🔴

**Severidad si falla:** Crítica

### Pasos:
1. Ir a pantalla de ventas `/app/sell`
2. Buscar un producto por nombre
3. Agregar al carrito (cantidad: 2)
4. Verificar total calculado
5. Click en "Cobrar" → Seleccionar "Efectivo"
6. Ingresar monto recibido
7. Confirmar venta

### Expected:
- [ ] Producto se encuentra en búsqueda
- [ ] Total = precio × cantidad
- [ ] Vuelto calculado correctamente
- [ ] Ticket generado con número único
- [ ] Stock actualizado
- [ ] Venta aparece en historial

### Notas:
```


```

---

## ST-03: Venta con Balanza 🔴

**Severidad si falla:** Crítica

### Pasos:
1. Ir a ventas `/app/sell`
2. Buscar producto por peso (ej: "Costilla")
3. Ingresar peso manualmente (2.5 kg)
4. Verificar precio = precio_kg × peso
5. Confirmar venta con efectivo

### Expected:
- [ ] Producto por kg se muestra correctamente
- [ ] Cálculo: $precio × 2.5kg = total correcto
- [ ] Decimales se manejan bien
- [ ] Stock se descuenta por peso

### Notas:
```


```

---

## ST-04: Venta con Tarjeta 🟠

**Severidad si falla:** Alta

### Pasos:
1. Crear venta con 1 producto
2. Seleccionar método "Tarjeta"
3. Simular aprobación
4. Verificar ticket con datos de tarjeta
5. (Si hay integración) Simular rechazo

### Expected:
- [ ] Opción tarjeta disponible
- [ ] Venta aprobada se registra
- [ ] Venta rechazada no afecta stock
- [ ] Voucher/ticket incluye método de pago

### Notas:
```


```

---

## ST-05: Anulación de Venta 🟠

**Severidad si falla:** Alta

### Pasos:
1. Realizar venta simple (ST-02)
2. Ir a historial de ventas
3. Seleccionar la venta recién hecha
4. Click en "Anular"
5. Confirmar anulación

### Expected:
- [ ] Venta se marca como anulada
- [ ] Stock se revierte (cantidad vuelve)
- [ ] Totales de caja se ajustan
- [ ] Queda registro en bitácora

### Notas:
```


```

---

## ST-06: Corte de Caja 🔴

**Severidad si falla:** Crítica

### Pasos:
1. Realizar 2-3 ventas mixtas (efectivo + tarjeta)
2. Ir a "Corte de Caja" o "Cierre"
3. Revisar totales por método de pago
4. Ingresar efectivo contado
5. Confirmar corte

### Expected:
- [ ] Total efectivo = suma de ventas efectivo
- [ ] Total tarjeta = suma de ventas tarjeta
- [ ] Diferencia se calcula si hay faltante/sobrante
- [ ] Reporte de cierre se genera
- [ ] Nuevo turno puede iniciarse

### Notas:
```


```

---

## ST-07: Gestión de Stock 🟠

**Severidad si falla:** Alta

### Pasos:
1. Ir a "Productos" o "Inventario"
2. Crear nuevo producto (nombre, precio, stock inicial)
3. Editar producto existente (cambiar precio)
4. Ajustar stock manualmente (+10 unidades)
5. Verificar que cambios persisten

### Expected:
- [ ] Alta de producto OK
- [ ] Edición guarda cambios
- [ ] Ajuste de stock se refleja
- [ ] Historial de cambios (si existe)

### Notas:
```


```

---

## ST-08: Cambio de Precios 🟠

**Severidad si falla:** Alta

### Pasos:
1. Anotar precio actual de un producto
2. Editar precio (aumentar 10%)
3. Guardar cambios
4. Ir a ventas y agregar ese producto
5. Verificar que usa precio nuevo

### Expected:
- [ ] Precio se actualiza en producto
- [ ] Ventas nuevas usan precio nuevo
- [ ] Ventas anteriores mantienen precio histórico

### Notas:
```


```

---

## ST-09: Reporte Diario 🟡

**Severidad si falla:** Media

### Pasos:
1. Ir a "Reportes" o "Dashboard"
2. Seleccionar fecha de hoy
3. Verificar total de ventas
4. Filtrar por método de pago
5. Exportar a PDF/Excel (si existe)

### Expected:
- [ ] Reporte muestra ventas del día
- [ ] Filtros funcionan
- [ ] Totales coinciden con ventas reales
- [ ] Exportación genera archivo válido

### Notas:
```


```

---

## ST-10: Recuperación Offline 🔴

**Severidad si falla:** Crítica

### Pasos:
1. Desconectar internet (modo avión o apagar WiFi)
2. Realizar una venta simple
3. Verificar que se guarda localmente
4. Reconectar internet
5. Verificar sincronización

### Expected:
- [ ] Venta se puede completar offline
- [ ] Datos no se pierden
- [ ] Al reconectar, se sincroniza
- [ ] No hay ventas duplicadas
- [ ] Dashboard se actualiza

### Notas:
```


```

---

## 📊 Resumen de Ejecución

| Test | Estado | Ejecutado por | Fecha |
|------|:------:|---------------|-------|
| ST-01 | ☐ Pass / ☐ Fail | | |
| ST-02 | ☐ Pass / ☐ Fail | | |
| ST-03 | ☐ Pass / ☐ Fail | | |
| ST-04 | ☐ Pass / ☐ Fail | | |
| ST-05 | ☐ Pass / ☐ Fail | | |
| ST-06 | ☐ Pass / ☐ Fail | | |
| ST-07 | ☐ Pass / ☐ Fail | | |
| ST-08 | ☐ Pass / ☐ Fail | | |
| ST-09 | ☐ Pass / ☐ Fail | | |
| ST-10 | ☐ Pass / ☐ Fail | | |

**Total:** ___/10

**Resultado:** ☐ PASS (10/10) / ☐ FAIL (< 10)

---

## 🐛 Bugs Encontrados

| Bug ID | Test | Severidad | Descripción |
|--------|------|-----------|-------------|
| | | | |
| | | | |

---

<div align="center">

**Versión testeada:** vX.X.X

**Fecha:** YYYY-MM-DD

**Tester:** _______________

</div>
