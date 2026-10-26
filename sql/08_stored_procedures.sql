-- SECCION 6: PROCEDIMIENTOS ALMACENADOS
-- Trabajo Practico N° 2 - RENTAL_CARS

USE RENTAL_CARS;


-- EJERCICIO 1
-- Procedimiento para registrar un alquiler.
-- Verifica que el vehiculo este disponible,
-- calcula el importe total y registra el alquiler.


DELIMITER $$

CREATE PROCEDURE SP_REGISTRAR_ALQUILER(
    IN p_id_cliente INT,
    IN p_id_vehiculo INT,
    IN p_id_empleado INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN

    DECLARE v_estado TINYINT;
    DECLARE v_precio_dia DECIMAL(9,2);
    DECLARE v_cantidad_dias INT;
    DECLARE v_total DECIMAL(9,2);
    DECLARE v_id_sucursal INT;

    -- Verificar que las fechas sean correctas

    IF p_fecha_inicio IS NULL
       OR p_fecha_fin IS NULL
       OR p_fecha_fin <= p_fecha_inicio THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Las fechas del alquiler no son validas';

    END IF;

    -- Obtener los datos del vehiculo

    SELECT estado, precio_dia, id_sucursal
    INTO v_estado, v_precio_dia, v_id_sucursal
    FROM VEHICULOS
    WHERE id = p_id_vehiculo;

    -- Verificar que el vehiculo exista y este disponible

    IF v_estado IS NULL OR v_estado = 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El vehiculo no existe o no esta disponible';

    ELSE

        -- Calcular la cantidad de dias

        SET v_cantidad_dias =
            DATEDIFF(p_fecha_fin, p_fecha_inicio);

        -- Calcular el importe total

        SET v_total = v_cantidad_dias * v_precio_dia;

        -- Registrar el nuevo alquiler

        INSERT INTO ALQUILERES (
            id_cliente,
            id_vehiculo,
            fecha_inicio,
            fecha_fin,
            total,
            id_empleado,
            id_sucursal_retiro,
            id_sucursal_devolucion,
            estado
        )
        VALUES (
            p_id_cliente,
            p_id_vehiculo,
            p_fecha_inicio,
            p_fecha_fin,
            v_total,
            p_id_empleado,
            v_id_sucursal,
            v_id_sucursal,
            'activo'
        );

        -- Mostrar mensaje de confirmacion

        SELECT
            'Alquiler registrado correctamente' AS mensaje,
            LAST_INSERT_ID() AS id_alquiler,
            v_total AS total;

    END IF;

END$$

DELIMITER ;


-- EJERCICIO 2
-- Procedimiento para registrar una multa.
-- Verifica que el alquiler exista.
-- Registra la multa como no pagada.


DELIMITER $$

CREATE PROCEDURE SP_CALCULAR_MULTA(
    IN p_id_alquiler INT,
    IN p_motivo VARCHAR(120),
    IN p_monto DECIMAL(9,2)
)
BEGIN

    DECLARE v_cantidad INT;

    -- Verificar si existe el alquiler

    SELECT COUNT(*)
    INTO v_cantidad
    FROM ALQUILERES
    WHERE id_alquiler = p_id_alquiler;

    IF v_cantidad = 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El alquiler indicado no existe';

    ELSEIF p_monto IS NULL OR p_monto <= 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El monto de la multa debe ser mayor a cero';

    ELSE

        -- Registrar la multa

        INSERT INTO MULTAS (
            id_alquiler,
            fecha,
            motivo,
            monto,
            pagada
        )
        VALUES (
            p_id_alquiler,
            CURDATE(),
            p_motivo,
            p_monto,
            0
        );

        -- Mostrar mensaje de confirmacion

        SELECT
            'Multa registrada correctamente' AS mensaje,
            LAST_INSERT_ID() AS id_multa,
            p_monto AS monto;

    END IF;

END$$

DELIMITER ;
