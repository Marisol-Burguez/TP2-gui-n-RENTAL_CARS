-- SECCION 7: USUARIOS Y PRIVILEGIOS (DCL)
-- Trabajo Practico N° 2 - RENTAL_CARS

USE RENTAL_CARS;


-- EJERCICIO 1
-- Crear un usuario para consultar informacion.
-- Solo podra conectarse desde localhost.

CREATE USER IF NOT EXISTS 'usuario_consulta'@'localhost'
IDENTIFIED BY 'Consulta2026!';


-- EJERCICIO 2
-- Otorgar permisos de lectura sobre todas
-- las tablas y vistas de RENTAL_CARS.

GRANT SELECT
ON RENTAL_CARS.*
TO 'usuario_consulta'@'localhost';


-- EJERCICIO 3
-- Crear un usuario para gestionar alquileres.

CREATE USER IF NOT EXISTS 'usuario_alquileres'@'localhost'
IDENTIFIED BY 'Alquileres2026!';


-- EJERCICIO 4
-- Otorgar permisos para consultar e insertar
-- registros en la tabla ALQUILERES.

GRANT SELECT, INSERT
ON RENTAL_CARS.ALQUILERES
TO 'usuario_alquileres'@'localhost';


-- EJERCICIO 5
-- Otorgar permiso de consulta sobre VEHICULOS
-- para verificar los vehiculos disponibles.

GRANT SELECT
ON RENTAL_CARS.VEHICULOS
TO 'usuario_alquileres'@'localhost';


-- EJERCICIO 6
-- Revocar el permiso de INSERT sobre ALQUILERES
-- al usuario_alquileres.

REVOKE INSERT
ON RENTAL_CARS.ALQUILERES
FROM 'usuario_alquileres'@'localhost';


-- EJERCICIO 7
-- Consultar los privilegios de ambos usuarios.

SHOW GRANTS FOR 'usuario_consulta'@'localhost';

SHOW GRANTS FOR 'usuario_alquileres'@'localhost';
