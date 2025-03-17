--CREACION DE TABLAS
CREATE TABLE Provincia (
id_provincia NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
desc_provincia VARCHAR2(100) NOT NULL,
fecha_registro DATE DEFAULT SYSDATE
);
--TABLA DISTRITO
CREATE TABLE  Distrito(
id_distrito NUMBER  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
id_provincia NUMBER NOT NULL,
desc_distrito VARCHAR2(100)  NOT NULL,
fecha_registro DATE DEFAULT SYSDATE,
CONSTRAINT fk_Distrito_Provincia FOREIGN KEY (id_provincia) REFERENCES Provincia (id_provincia) 
);
--tabla sede
CREATE TABLE Sede (
id_sede NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
desc_sede VARCHAR2(100) NOT NULL,
fecha_registro DATE DEFAULT SYSDATE
);
--TABLA GERENTE
CREATE TABLE Gerente (
id_gerente  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
desc_gerente VARCHAR2(100) NOT NULL,
fecha_registro DATE DEFAULT SYSDATE
);
--TABLA CONDICION
CREATE TABLE Condicion (
id_condicion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
desc_condicion VARCHAR2(100) NOT NULL,
fecha_registro DATE DEFAULT SYSDATE
);
-- AUDITORIA-HOSPITAL
CREATE TABLE Auditoria_Hospital (
    id_auditoria NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    accion VARCHAR2(10) CHECK (accion IN ('INSERT', 'UPDATE')),
    id_hospital NUMBER,
    nombre_anterior VARCHAR2(100),
    nombre_nuevo VARCHAR2(100),
    antiguedad_anterior NUMBER,
    antiguedad_nueva NUMBER,
    area_anterior NUMBER,
    area_nueva NUMBER,
    id_sede_anterior NUMBER,
    id_sede_nueva NUMBER,
    id_gerente_anterior NUMBER,
    id_gerente_nuevo NUMBER,
    id_condicion_anterior NUMBER,
    id_condicion_nueva NUMBER,
    fecha TIMESTAMP DEFAULT SYSTIMESTAMP
);
--TABLA HOSPITAL
CREATE TABLE Hospital (
id_hospital NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
id_distrito NUMBER NOT NULL,
nombre VARCHAR2(100)NOT NULL,
antiguedad NUMBER NOT NULL,
area DECIMAL(10,2) NOT NULL,
id_sede NUMBER NOT NULL,
id_gerente NUMBER NOT NULL,
id_condicion NUMBER NOT NULL,
fecha_registro DATE DEFAULT SYSDATE,
    CONSTRAINT fk_Hospital_Distrito FOREIGN KEY (id_distrito) REFERENCES Distrito(id_distrito),
    CONSTRAINT fk_Hospital_Sede FOREIGN KEY (id_sede) REFERENCES Sede(id_sede),
    CONSTRAINT fk_Hospital_Gerente FOREIGN KEY (id_gerente) REFERENCES Gerente(id_gerente),
    CONSTRAINT fk_Hospital_Condicion FOREIGN KEY (id_condicion) REFERENCES Condicion(id_condicion)
);
