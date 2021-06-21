-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-06-18 17:57:51.506

-- tables
-- Table: ACOPIO
CREATE TABLE ACOPIO (
    ID_acopio int AUTO_INCREMENT NOT NULL,
    ID_material int NOT NULL,
    tipo_dni varchar(3) NOT NULL,
    nro_dni int NOT NULL,
    kilos_acopiados double(8,2) NOT NULL,
    CONSTRAINT PK_ACOPIO PRIMARY KEY (id_acopio)
);

-- Table: CARTONERO
CREATE TABLE CARTONERO (
    tipo_dni varchar(3) NOT NULL,
    nro_dni int NOT NULL,
    nombre varchar(30) NOT NULL,
    apellido varchar(30) NOT NULL,
    direccion varchar(30) NOT NULL,
    fecha_nac date NOT NULL,
    vehiculo varchar(30) NOT NULL,
    CONSTRAINT PK_CARTONERO PRIMARY KEY (tipo_dni,nro_dni)
);

-- Table: CIUDADANO
CREATE TABLE CIUDADANO (
    ID_ciudadano int AUTO_INCREMENT NOT NULL,
    nombre varchar(30) NOT NULL DEFAULT 'Ciudadano',
    apellido varchar(30) NOT NULL DEFAULT 'Buena onda',
    direccion varchar(30) NOT NULL DEFAULT 'Cooperativa',
    telefono varchar(12) NOT NULL,
    CONSTRAINT PK_CIUDADANO PRIMARY KEY (ID_ciudadano)
);

-- Table: MATERIAL
CREATE TABLE MATERIAL (
    ID_material int AUTO_INCREMENT NOT NULL,
    nombre varchar(20) NOT NULL,
    formato_entrega varchar(100) NOT NULL,
    restricciones varchar(300) NULL,
    CONSTRAINT PK_MATERIAL PRIMARY KEY (ID_material)
);

-- Table: PEDIDO
CREATE TABLE PEDIDO (
    ID_pedido int AUTO_INCREMENT NOT NULL,
    ciudadano int NOT NULL,
    material int NOT NULL,
    franja_horaria varchar(10) NOT NULL,
    cumple_retiro boolean NOT NULL,
    imagen varchar(30) NULL,
    direccion varchar(30) NOT NULL,
    fecha_y_hora timestamp NOT NULL,
    volumen varchar(30) NOT NULL,
    UNIQUE INDEX AK_CIUDADANO_PEDIDO (ciudadano),
    UNIQUE INDEX AK_PEDIDO_MATERIAL (material),
    CONSTRAINT PK_PEDIDO PRIMARY KEY (ID_pedido,ciudadano,material)
);

-- foreign keys
-- Reference: FK_ACOPIO_CARTONERO (table: ACOPIO)
ALTER TABLE ACOPIO ADD CONSTRAINT FK_ACOPIO_CARTONERO FOREIGN KEY FK_ACOPIO_CARTONERO (tipo_dni,nro_dni)
    REFERENCES CARTONERO (tipo_dni,nro_dni);

-- Reference: FK_ACOPIO_MATERIAL (table: ACOPIO)
ALTER TABLE ACOPIO ADD CONSTRAINT FK_ACOPIO_MATERIAL FOREIGN KEY FK_ACOPIO_MATERIAL (ID_material)
    REFERENCES MATERIAL (ID_material);

-- Reference: FK_PEDIDO_CIUDADANO (table: PEDIDO)
ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO_CIUDADANO FOREIGN KEY FK_PEDIDO_CIUDADANO (ciudadano)
    REFERENCES CIUDADANO (ID_ciudadano);

-- Reference: FK_PEDIDO_MATERIAL (table: PEDIDO)
ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO_MATERIAL FOREIGN KEY FK_PEDIDO_MATERIAL (material)
    REFERENCES MATERIAL (ID_material);

-- End of file.

