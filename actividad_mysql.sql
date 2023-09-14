/* Crear base de datos df_GamarraMarket*/
DROP DATABASE IF EXISTS df_GamarraMarket;
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;
/* Activar*/
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int,
    tipo_documento char(3),
    numero_documento char(15),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;
/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;
-- Table: PRENDA
CREATE TABLE PRENDA (
    id int  NOT NULL COMMENT 'Contiene el identificador único de una prenda',
    descripcion varchar(90)  NOT NULL COMMENT 'Contiene la descripción de la prenda',
    marca varchar(60)  NOT NULL COMMENT 'Contiene el nombre de la marca de la prenda',
    cantidad int  NOT NULL COMMENT 'Cantidad de prendas con las que cuenta la tienda',
    talla varchar(10)  NOT NULL COMMENT 'Contiene la talla de cada prenda',
    precio decimal(8,2)  NOT NULL COMMENT 'Contiene el precio de cada prenda',
    activo bool  NOT NULL COMMENT 'Estado activo o inactivo de la prenda',
    CONSTRAINT PRENDA_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de las prendas';

-- Table: VENDEDOR
CREATE TABLE VENDEDOR (
    id int  NOT NULL COMMENT 'Contiene el identificador único de un vendedor',
    tipo_documento char(3)  NOT NULL COMMENT 'Contiene el tipo de documento: DNI - CNE',
    numero_documento char(15)  NOT NULL COMMENT 'Número de documento de identidad',
    nombres varchar(60)  NOT NULL COMMENT 'Nombres del vendedor',
    apellidos varchar(90)  NOT NULL COMMENT 'Apellidos del vendedor',
    salario decimal(8,2)  NOT NULL COMMENT 'Contiene el salario del vendedor',
    celular char(9)  NULL COMMENT 'Número de celular del vendedor',
    email varchar(80)  NULL COMMENT 'Correo Electrónico del vendedor',
    activo bool  NOT NULL COMMENT 'Estado activo o inactivo del vendedor',
    venta_id int  NOT NULL,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de los vendedores';

-- Table: VENTA
CREATE TABLE VENTA (
    id int  NOT NULL COMMENT 'Contiene el identificador de cada venta',
    fecha_hora timestamp  NOT NULL COMMENT 'Fecha y hora en que se realizó la venta',
    activo bool  NOT NULL COMMENT 'Estado activo o inactivo de la venta',
    cliente_id int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de registro de la venta';

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    id int  NOT NULL COMMENT 'Contiene el identificador de detalle de venta',
    cantidad int  NOT NULL COMMENT 'Cantidad de las prendas en el detalle de venta',
    venta_id int  NOT NULL,
    PRENDA_id int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de registro de la venta detalle';

-- foreign keys
-- Reference: VENDEDOR_VENTA (table: VENDEDOR)
ALTER TABLE VENDEDOR ADD CONSTRAINT VENDEDOR_VENTA FOREIGN KEY VENDEDOR_VENTA (venta_id)
    REFERENCES VENTA (id);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (cliente_id)
    REFERENCES CLIENTE (id);

-- Reference: VENTA_DETALLE_PRENDA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY VENTA_DETALLE_PRENDA (PRENDA_id)
    REFERENCES PRENDA (id);

-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY VENTA_DETALLE_VENTA (venta_id)
    REFERENCES VENTA (id);






