-- SECCION 2: CONSULTAS SELECT
-- Trabajo Practico N° 2 - RENTAL_CARS

USE RENTAL_CARS;


-- CONSULTA 1
-- Mostrar marca, modelo y año de todos los vehiculos,
-- ordenados del mas antiguo al mas nuevo.

SELECT marca, modelo, anio
FROM VEHICULOS
ORDER BY anio ASC;


-- CONSULTA 2
-- Mostrar nombre, email y ciudad de los clientes
-- registrados durante el mes anterior.

SELECT nombre, email, ciudad
FROM CLIENTES
WHERE fecha_registro >= DATE_FORMAT(
    CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01'
)
AND fecha_registro < DATE_FORMAT(
    CURDATE(), '%Y-%m-01'
);


-- CONSULTA 3
-- Mostrar marca, modelo y precio por dia
-- de los vehiculos de la categoria con id = 2.

SELECT marca, modelo, precio_dia
FROM VEHICULOS
WHERE id_categoria = 2;


-- CONSULTA 4
-- Mostrar todos los empleados cuyo nombre
-- comience con la letra L.

SELECT *
FROM EMPLEADOS
WHERE nombre LIKE 'L%';


-- CONSULTA 5
-- Mostrar nombre y cargo de los empleados
-- cuyo salario sea distinto de 180000.

SELECT nombre, cargo
FROM EMPLEADOS
WHERE salario <> 180000.00;


-- CONSULTA 6
-- Mostrar marca y modelo del vehiculo
-- junto con el nombre de su categoria.

SELECT
    v.marca,
    v.modelo,
    c.nombre AS categoria
FROM VEHICULOS AS v
INNER JOIN CATEGORIAS AS c
    ON v.id_categoria = c.id;


-- CONSULTA 7
-- Mostrar fecha de inicio del alquiler,
-- nombre del cliente, marca y modelo del vehiculo
-- y nombre del empleado que lo gestiono.

SELECT
    a.fecha_inicio,
    c.nombre AS cliente,
    CONCAT(v.marca, ' ', v.modelo) AS vehiculo,
    e.nombre AS empleado
FROM ALQUILERES AS a
INNER JOIN CLIENTES AS c
    ON a.id_cliente = c.id
INNER JOIN VEHICULOS AS v
    ON a.id_vehiculo = v.id
INNER JOIN EMPLEADOS AS e
    ON a.id_empleado = e.id;


-- CONSULTA 8
-- Mostrar nombre, ciudad y fecha de registro
-- de todos los clientes.

SELECT nombre, ciudad, fecha_registro
FROM CLIENTES;


-- CONSULTA 9
-- Mostrar marca y modelo del vehiculo,
-- nombre de la sucursal y ciudad.

SELECT
    v.marca,
    v.modelo,
    s.nombre AS sucursal,
    s.ciudad
FROM VEHICULOS AS v
INNER JOIN SUCURSALES AS s
    ON v.id_sucursal = s.id;


-- CONSULTA 10
-- Mostrar el alquiler y los nombres de las sucursales
-- de retiro y devolucion.

SELECT
    a.id_alquiler AS alquiler,
    sr.nombre AS sucursal_retiro,
    sd.nombre AS sucursal_devolucion
FROM ALQUILERES AS a
INNER JOIN SUCURSALES AS sr
    ON a.id_sucursal_retiro = sr.id
INNER JOIN SUCURSALES AS sd
    ON a.id_sucursal_devolucion = sd.id;


-- CONSULTA 11
-- Mostrar cantidad de vehiculos por categoria.

SELECT
    c.nombre AS categoria,
    COUNT(v.id) AS cantidad_vehiculos
FROM CATEGORIAS AS c
LEFT JOIN VEHICULOS AS v
    ON c.id = v.id_categoria
GROUP BY c.id, c.nombre;


-- CONSULTA 12
-- Calcular el precio promedio por dia
-- de los vehiculos agrupados por categoria.

SELECT
    c.nombre AS categoria,
    ROUND(AVG(v.precio_dia), 2) AS precio_promedio
FROM CATEGORIAS AS c
INNER JOIN VEHICULOS AS v
    ON c.id = v.id_categoria
GROUP BY c.id, c.nombre;


-- CONSULTA 13
-- Mostrar nombre del empleado y cantidad
-- de alquileres gestionados.
-- Ordenar de mayor a menor.

SELECT
    e.nombre AS empleado,
    COUNT(a.id_alquiler) AS total_alquileres
FROM EMPLEADOS AS e
LEFT JOIN ALQUILERES AS a
    ON e.id = a.id_empleado
GROUP BY e.id, e.nombre
ORDER BY total_alquileres DESC;


-- CONSULTA 14
-- Mostrar clientes que tienen
-- mas de un alquiler registrado.

SELECT
    c.nombre AS cliente,
    COUNT(a.id_alquiler) AS cantidad_alquileres
FROM CLIENTES AS c
INNER JOIN ALQUILERES AS a
    ON c.id = a.id_cliente
GROUP BY c.id, c.nombre
HAVING COUNT(a.id_alquiler) > 1;


-- CONSULTA 15
-- Mostrar cantidad de sucursales por ciudad.

SELECT
    ciudad,
    COUNT(*) AS cantidad_sucursales
FROM SUCURSALES
GROUP BY ciudad;


-- CONSULTA 16
-- Mostrar marca, modelo y año
-- del vehiculo mas antiguo de la flota.

SELECT marca, modelo, anio
FROM VEHICULOS
WHERE anio = (
    SELECT MIN(anio)
    FROM VEHICULOS
);


-- CONSULTA 17
-- Mostrar los vehiculos
-- que nunca fueron alquilados.

SELECT
    v.id,
    v.marca,
    v.modelo,
    v.anio
FROM VEHICULOS AS v
LEFT JOIN ALQUILERES AS a
    ON v.id = a.id_vehiculo
WHERE a.id_alquiler IS NULL;


-- CONSULTA 18
-- Mostrar alquileres activos
-- que comenzaron en octubre de 2024.

SELECT *
FROM ALQUILERES
WHERE estado = 'activo'
AND fecha_inicio >= '2024-10-01'
AND fecha_inicio < '2024-11-01';


-- CONSULTA 19
-- Mostrar los tres vehiculos
-- con el precio por dia mas alto.

SELECT
    marca,
    modelo,
    precio_dia
FROM VEHICULOS
ORDER BY precio_dia DESC
LIMIT 3;


-- CONSULTA 20
-- Mostrar cantidad total de multas pagadas
-- y monto total recaudado.

SELECT
    COUNT(*) AS cantidad_multas_pagadas,
    COALESCE(SUM(monto), 0) AS total_recaudado
FROM MULTAS
WHERE pagada = 1;