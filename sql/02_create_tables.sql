-- SECCION 1.2: CREACION DE TABLAS
-- Trabajo Practico N° 2 - RENTAL_CARS

USE RENTAL_CARS;


-- 1. TABLA CATEGORIAS

CREATE TABLE CATEGORIAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion VARCHAR(120)
);


-- 2. TABLA SUCURSALES

CREATE TABLE SUCURSALES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    direccion VARCHAR(120),
    ciudad VARCHAR(50),
    telefono VARCHAR(30)
);


-- 3. TABLA CLIENTES

CREATE TABLE CLIENTES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    email VARCHAR(50),
    telefono VARCHAR(50),
    ciudad VARCHAR(50),
    fecha_registro DATE,
    licencia_conducir VARCHAR(30)
);


-- 4. TABLA EMPLEADOS

CREATE TABLE EMPLEADOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    cargo VARCHAR(50),
    id_sucursal INT,
    fecha_ingreso DATE,
    salario DECIMAL(10,2),

    FOREIGN KEY (id_sucursal)
        REFERENCES SUCURSALES(id)
);


-- 5. TABLA VEHICULOS

CREATE TABLE VEHICULOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    anio INT,
    precio_dia DECIMAL(9,2),
    estado TINYINT(1),
    id_categoria INT,
    id_sucursal INT,
    patente VARCHAR(15),
    km_actual INT,

    FOREIGN KEY (id_categoria)
        REFERENCES CATEGORIAS(id),

    FOREIGN KEY (id_sucursal)
        REFERENCES SUCURSALES(id)
);


-- 6. TABLA ALQUILERES

CREATE TABLE ALQUILERES (
    id_alquiler INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_vehiculo INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    total DECIMAL(9,2),
    id_empleado INT,
    id_sucursal_retiro INT,
    id_sucursal_devolucion INT,
    estado VARCHAR(20),

    FOREIGN KEY (id_cliente)
        REFERENCES CLIENTES(id),

    FOREIGN KEY (id_vehiculo)
        REFERENCES VEHICULOS(id),

    FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADOS(id),

    FOREIGN KEY (id_sucursal_retiro)
        REFERENCES SUCURSALES(id),

    FOREIGN KEY (id_sucursal_devolucion)
        REFERENCES SUCURSALES(id)
);


-- 7. TABLA RESERVAS

CREATE TABLE RESERVAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_vehiculo INT,
    fecha_reserva DATE,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(20),

    FOREIGN KEY (id_cliente)
        REFERENCES CLIENTES(id),

    FOREIGN KEY (id_vehiculo)
        REFERENCES VEHICULOS(id)
);


-- 8. TABLA PAGOS

CREATE TABLE PAGOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_alquiler INT,
    fecha_pago DATE,
    monto DECIMAL(9,2),

    FOREIGN KEY (id_alquiler)
        REFERENCES ALQUILERES(id_alquiler)
);


-- 9. TABLA MULTAS

CREATE TABLE MULTAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_alquiler INT,
    fecha DATE,
    motivo VARCHAR(120),
    monto DECIMAL(9,2),
    pagada TINYINT(1),

    FOREIGN KEY (id_alquiler)
        REFERENCES ALQUILERES(id_alquiler)
);


-- 10. TABLA SEGUROS

CREATE TABLE SEGUROS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_alquiler INT,
    compania VARCHAR(80),
    numero_poliza VARCHAR(50),
    cobertura VARCHAR(100),
    costo DECIMAL(9,2),

    FOREIGN KEY (id_alquiler)
        REFERENCES ALQUILERES(id_alquiler)
);


-- 11. TABLA MANTENIMIENTOS

CREATE TABLE MANTENIMIENTOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_vehiculo INT,
    fecha DATE,
    tipo VARCHAR(50),
    costo DECIMAL(9,2),
    observaciones VARCHAR(200),

    FOREIGN KEY (id_vehiculo)
        REFERENCES VEHICULOS(id)
);


-- 12. TABLA CHECK_ALQUILER

CREATE TABLE CHECK_ALQUILER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_alquiler INT,
    tipo VARCHAR(10),
    fecha DATETIME,
    km INT,
    nivel_combustible INT,

    FOREIGN KEY (id_alquiler)
        REFERENCES ALQUILERES(id_alquiler)
);
