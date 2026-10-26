-- SECCION 5: TRIGGERS
-- Trabajo Practico N° 2 - RENTAL_CARS

USE RENTAL_CARS;


-- EJERCICIO 1
-- Crear la tabla AUDITORIA_ALQUILERES.
-- Esta tabla guardara un registro cada vez
-- que se inserte un nuevo alquiler.

CREATE TABLE IF NOT EXISTS AUDITORIA_ALQUILERES (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    id_alquiler INT,
    id_cliente INT,
    id_vehiculo INT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    accion VARCHAR(50)
);


-- TRIGGER 1: TR_AUDITAR_ALQUILER
-- Se ejecuta automaticamente despues de insertar
-- un nuevo registro en la tabla ALQUILERES.

DELIMITER $$

CREATE TRIGGER TR_AUDITAR_ALQUILER
AFTER INSERT ON ALQUILERES
FOR EACH ROW
BEGIN

    INSERT INTO AUDITORIA_ALQUILERES
    (id_alquiler, id_cliente, id_vehiculo, fecha_registro, accion)
    VALUES
    (NEW.id_alquiler, NEW.id_cliente, NEW.id_vehiculo,
     NOW(), 'NUEVO ALQUILER');

END$$

DELIMITER ;


-- EJERCICIO 2
-- TRIGGER 2: TR_ACTUALIZAR_ESTADO_VEHICULO
-- Si se registra un alquiler activo,
-- el vehiculo pasa a estar no disponible.

DELIMITER $$

CREATE TRIGGER TR_ACTUALIZAR_ESTADO_VEHICULO
AFTER INSERT ON ALQUILERES
FOR EACH ROW
BEGIN

    IF NEW.estado = 'activo' THEN

        UPDATE VEHICULOS
        SET estado = FALSE
        WHERE id = NEW.id_vehiculo;

    END IF;

END$$

DELIMITER ;