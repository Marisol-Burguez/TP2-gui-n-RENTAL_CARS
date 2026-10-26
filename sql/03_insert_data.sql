-- SECCION 1.3: INSERCION DE DATOS
-- Trabajo Practico N° 2 - RENTAL_CARS

USE RENTAL_CARS;


-- 1. TABLA CATEGORIAS

INSERT INTO CATEGORIAS (id, nombre, descripcion) VALUES
(1, 'Economico', 'Vehiculos economicos de bajo consumo'),
(2, 'SUV', 'Vehiculos deportivos utilitarios'),
(3, 'Sedan', 'Vehiculos familiares'),
(4, 'Pickup', 'Camionetas de carga'),
(5, 'Premium', 'Vehiculos de alta gama');


-- 2. TABLA SUCURSALES

INSERT INTO SUCURSALES (id, nombre, direccion, ciudad, telefono) VALUES
(1, 'Sucursal Centro', 'Av. Libertador 1200', 'San Juan', '2644001111'),
(2, 'Sucursal Norte', 'Av. Ignacio de la Roza 850', 'San Juan', '2644002222'),
(3, 'Sucursal Mendoza', 'San Martin 1500', 'Mendoza', '2614003333'),
(4, 'Sucursal Cordoba', 'Colon 900', 'Cordoba', '3514004444'),
(5, 'Sucursal Rosario', 'Pellegrini 600', 'Rosario', '3414005555');


-- 3. TABLA CLIENTES

INSERT INTO CLIENTES
(id, nombre, email, telefono, ciudad, fecha_registro, licencia_conducir)
VALUES
(1, 'Juan Perez', 'juan@gmail.com', '2645001111', 'San Juan', '2026-09-10', 'LIC001'),
(2, 'Maria Gomez', 'maria@gmail.com', '2645002222', 'San Juan', '2026-09-15', 'LIC002'),
(3, 'Carlos Lopez', 'carlos@gmail.com', '2615003333', 'Mendoza', '2026-08-20', 'LIC003'),
(4, 'Lucia Fernandez', 'lucia@gmail.com', '3515004444', 'Cordoba', '2026-09-22', 'LIC004'),
(5, 'Pedro Martinez', 'pedro@gmail.com', '3415005555', 'Rosario', '2026-07-05', 'LIC005'),
(6, 'Ana Rodriguez', 'ana@gmail.com', '2645006666', 'San Juan', '2026-09-25', 'LIC006'),
(7, 'Luis Sanchez', 'luis@gmail.com', '2615007777', 'Mendoza', '2026-06-12', 'LIC007'),
(8, 'Sofia Torres', 'sofia@gmail.com', '3515008888', 'Cordoba', '2026-09-28', 'LIC008');


-- 4. TABLA EMPLEADOS

INSERT INTO EMPLEADOS
(id, nombre, cargo, id_sucursal, fecha_ingreso, salario)
VALUES
(1, 'Laura Martinez', 'Vendedora', 1, '2020-03-15', 180000.00),
(2, 'Luis Fernandez', 'Vendedor', 2, '2019-06-10', 175000.00),
(3, 'Carlos Ramirez', 'Gerente', 3, '2018-02-20', 300000.00),
(4, 'Luciana Perez', 'Vendedora', 4, '2022-05-12', 190000.00),
(5, 'Pedro Sanchez', 'Vendedor', 5, '2020-11-08', 180000.00),
(6, 'Ana Gomez', 'Administrativa', 1, '2021-04-18', 210000.00);


-- 5. TABLA VEHICULOS

INSERT INTO VEHICULOS
(id, marca, modelo, anio, precio_dia, estado, id_categoria, id_sucursal, patente, km_actual)
VALUES
(1, 'Fiat', 'Cronos', 2022, 35000.00, 1, 1, 1, 'AA123BB', 45000),
(2, 'Toyota', 'Corolla', 2021, 50000.00, 1, 3, 2, 'AB456CD', 60000),
(3, 'Ford', 'Ranger', 2023, 85000.00, 1, 4, 3, 'AC789EF', 30000),
(4, 'Volkswagen', 'Gol', 2018, 28000.00, 1, 1, 1, 'AD123GH', 95000),
(5, 'Jeep', 'Renegade', 2022, 65000.00, 1, 2, 4, 'AE456IJ', 40000),
(6, 'Toyota', 'Hilux', 2024, 95000.00, 1, 4, 5, 'AF789KL', 15000),
(7, 'BMW', '320i', 2023, 120000.00, 1, 5, 2, 'AG123MN', 20000),
(8, 'Chevrolet', 'Onix', 2020, 32000.00, 1, 1, 3, 'AH456OP', 70000),
(9, 'Renault', 'Duster', 2021, 60000.00, 1, 2, 1, 'AI789QR', 55000),
(10, 'Mercedes Benz', 'Clase C', 2024, 150000.00, 1, 5, 4, 'AJ123ST', 10000),
(11, 'Peugeot', '208', 2023, 42000.00, 1, 1, 5, 'AK456UV', 25000),
(12, 'Honda', 'Civic', 2019, 48000.00, 1, 3, 2, 'AL789WX', 80000);


-- 6. TABLA ALQUILERES

INSERT INTO ALQUILERES
(id_alquiler, id_cliente, id_vehiculo, fecha_inicio, fecha_fin, total,
id_empleado, id_sucursal_retiro, id_sucursal_devolucion, estado)
VALUES
(1, 1, 1, '2024-10-05', '2024-10-08', 105000.00, 1, 1, 1, 'finalizado'),
(2, 2, 2, '2024-10-10', '2024-10-15', 250000.00, 2, 2, 3, 'finalizado'),
(3, 3, 3, '2024-10-12', '2024-10-16', 340000.00, 3, 3, 3, 'activo'),
(4, 1, 4, '2024-11-01', '2024-11-04', 84000.00, 1, 1, 2, 'finalizado'),
(5, 4, 5, '2025-01-10', '2025-01-15', 325000.00, 4, 4, 4, 'finalizado'),
(6, 5, 6, '2025-02-05', '2025-02-10', 475000.00, 5, 5, 1, 'finalizado'),
(7, 2, 7, '2025-03-12', '2025-03-15', 360000.00, 2, 2, 2, 'finalizado'),
(8, 6, 8, '2025-04-01', '2025-04-05', 128000.00, 3, 3, 3, 'finalizado'),
(9, 7, 9, '2025-05-10', '2025-05-13', 180000.00, 1, 1, 4, 'finalizado'),
(10, 8, 10, '2025-06-01', '2025-06-04', 450000.00, 4, 4, 4, 'finalizado');


-- 7. TABLA RESERVAS

INSERT INTO RESERVAS
(id, id_cliente, id_vehiculo, fecha_reserva, fecha_inicio, fecha_fin, estado)
VALUES
(1, 1, 2, '2026-10-01', '2026-11-01', '2026-11-05', 'confirmada'),
(2, 3, 5, '2026-10-02', '2026-11-10', '2026-11-15', 'pendiente'),
(3, 4, 6, '2026-10-03', '2026-12-01', '2026-12-05', 'confirmada'),
(4, 6, 9, '2026-10-04', '2026-11-20', '2026-11-25', 'pendiente');


-- 8. TABLA PAGOS

INSERT INTO PAGOS
(id, id_alquiler, fecha_pago, monto)
VALUES
(1, 1, '2024-10-08', 105000.00),
(2, 2, '2024-10-15', 250000.00),
(3, 4, '2024-11-04', 84000.00),
(4, 5, '2025-01-15', 325000.00),
(5, 6, '2025-02-10', 475000.00),
(6, 7, '2025-03-15', 360000.00),
(7, 8, '2025-04-05', 128000.00),
(8, 9, '2025-05-13', 180000.00),
(9, 10, '2025-06-04', 450000.00);


-- 9. TABLA MULTAS

INSERT INTO MULTAS
(id, id_alquiler, fecha, motivo, monto, pagada)
VALUES
(1, 1, '2024-10-08', 'Entrega fuera de horario', 15000.00, 1),
(2, 2, '2024-10-15', 'Exceso de kilometraje', 25000.00, 1),
(3, 4, '2024-11-04', 'Vehiculo sucio', 10000.00, 0),
(4, 5, '2025-01-15', 'Retraso en devolucion', 30000.00, 1),
(5, 7, '2025-03-15', 'Exceso de kilometraje', 20000.00, 0);


-- 10. TABLA SEGUROS

INSERT INTO SEGUROS
(id, id_alquiler, compania, numero_poliza, cobertura, costo)
VALUES
(1, 1, 'La Caja', 'POL001', 'Cobertura total', 12000.00),
(2, 2, 'Sancor Seguros', 'POL002', 'Terceros completos', 15000.00),
(3, 3, 'Federacion Patronal', 'POL003', 'Cobertura total', 18000.00),
(4, 5, 'La Segunda', 'POL004', 'Terceros completos', 14000.00),
(5, 6, 'La Caja', 'POL005', 'Cobertura total', 20000.00);


-- 11. TABLA MANTENIMIENTOS

INSERT INTO MANTENIMIENTOS
(id, id_vehiculo, fecha, tipo, costo, observaciones)
VALUES
(1, 1, '2026-01-10', 'Cambio de aceite', 45000.00, 'Mantenimiento preventivo'),
(2, 3, '2026-02-15', 'Cambio de frenos', 85000.00, 'Reemplazo de pastillas'),
(3, 5, '2026-03-20', 'Service general', 120000.00, 'Revision completa'),
(4, 7, '2026-04-12', 'Cambio de neumaticos', 250000.00, 'Reemplazo de cuatro neumaticos'),
(5, 9, '2026-05-18', 'Cambio de aceite', 50000.00, 'Mantenimiento preventivo');


-- 12. TABLA CHECK_ALQUILER

INSERT INTO CHECK_ALQUILER
(id, id_alquiler, tipo, fecha, km, nivel_combustible)
VALUES
(1, 1, 'salida', '2024-10-05 09:00:00', 44000, 100),
(2, 1, 'entrada', '2024-10-08 18:00:00', 44500, 75),
(3, 2, 'salida', '2024-10-10 10:00:00', 59000, 100),
(4, 2, 'entrada', '2024-10-15 17:00:00', 59800, 50),
(5, 3, 'salida', '2024-10-12 08:00:00', 29000, 100),
(6, 4, 'salida', '2024-11-01 09:00:00', 94000, 100),
(7, 4, 'entrada', '2024-11-04 18:00:00', 94500, 75);