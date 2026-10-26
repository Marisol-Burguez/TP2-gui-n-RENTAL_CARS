-- SECCION 3: OPERACIONES DML
-- Trabajo Practico N° 2 - RENTAL_CARS

USE RENTAL_CARS;


-- EJERCICIO 1
-- Insertar un nuevo cliente.
-- Debe tener una licencia nueva y una ciudad existente.

INSERT INTO CLIENTES
(nombre, email, telefono, ciudad, fecha_registro, licencia_conducir)
VALUES
('Martin Gonzalez', 'martin@gmail.com', '2645559999',
'San Juan', CURDATE(), 'LIC009');


-- EJERCICIO 2
-- Actualizar el salario a 200000.00
-- de los empleados cuyo cargo sea Vendedor o Vendedora
-- y que hayan ingresado antes del 01/01/2021.

UPDATE EMPLEADOS
SET salario = 200000.00
WHERE cargo IN ('Vendedor', 'Vendedora')
AND fecha_ingreso < '2021-01-01';


-- EJERCICIO 3
-- Eliminar un vehiculo que no tenga alquileres,
-- reservas ni mantenimientos asociados.
-- Se elimina el vehiculo con id = 12.

DELETE FROM VEHICULOS
WHERE id = 12
AND NOT EXISTS (
    SELECT 1
    FROM ALQUILERES
    WHERE id_vehiculo = 12
)
AND NOT EXISTS (
    SELECT 1
    FROM RESERVAS
    WHERE id_vehiculo = 12
)
AND NOT EXISTS (
    SELECT 1
    FROM MANTENIMIENTOS
    WHERE id_vehiculo = 12
);


-- EJERCICIO 4
-- Cambiar de sucursal un vehiculo.
-- Se traslada el vehiculo con id = 11
-- a la sucursal con id = 2.

UPDATE VEHICULOS
SET id_sucursal = 2
WHERE id = 11;