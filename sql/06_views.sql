-- SECCION 4: VISTAS
-- Trabajo Practico N° 2 - RENTAL_CARS

USE RENTAL_CARS;


-- EJERCICIO 1
-- Vista que muestra el detalle de los alquileres
-- con los nombres de clientes, vehiculos, empleados y sucursales.

CREATE OR REPLACE VIEW VW_ALQUILERES_DETALLE AS
SELECT
    a.fecha_inicio,
    a.fecha_fin,
    c.nombre AS cliente,
    CONCAT(v.marca, ' ', v.modelo) AS vehiculo,
    e.nombre AS empleado,
    sr.nombre AS sucursal_retiro,
    sd.nombre AS sucursal_devolucion,
    a.total
FROM ALQUILERES AS a
INNER JOIN CLIENTES AS c
    ON a.id_cliente = c.id
INNER JOIN VEHICULOS AS v
    ON a.id_vehiculo = v.id
INNER JOIN EMPLEADOS AS e
    ON a.id_empleado = e.id
INNER JOIN SUCURSALES AS sr
    ON a.id_sucursal_retiro = sr.id
INNER JOIN SUCURSALES AS sd
    ON a.id_sucursal_devolucion = sd.id;


-- EJERCICIO 2
-- Vista que muestra la cantidad de vehiculos por sucursal.

CREATE OR REPLACE VIEW VW_VEHICULOS_POR_SUCURSAL AS
SELECT
    s.nombre AS sucursal,
    s.ciudad,
    COUNT(v.id) AS cantidad_vehiculos
FROM SUCURSALES AS s
LEFT JOIN VEHICULOS AS v
    ON s.id = v.id_sucursal
GROUP BY s.id, s.nombre, s.ciudad;


-- EJERCICIO 3
-- Vista que muestra los ingresos por categoria.
-- Solo se consideran los alquileres finalizados.

CREATE OR REPLACE VIEW VW_INGRESOS_POR_CATEGORIA AS
SELECT
    c.nombre AS categoria,
    COUNT(a.id_alquiler) AS cantidad_alquileres_finalizados,
    COALESCE(SUM(a.total), 0) AS total_facturado
FROM CATEGORIAS AS c
LEFT JOIN VEHICULOS AS v
    ON c.id = v.id_categoria
LEFT JOIN ALQUILERES AS a
    ON v.id = a.id_vehiculo
    AND a.estado = 'finalizado'
GROUP BY c.id, c.nombre;