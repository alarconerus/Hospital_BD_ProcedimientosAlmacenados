INSERT INTO Provincia (desc_provincia) VALUES ('Lima');
INSERT INTO Provincia (desc_provincia) VALUES ('Cusco');
INSERT INTO Provincia (desc_provincia) VALUES ('Arequipa');
INSERT INTO Provincia (desc_provincia) VALUES ('Trujillo');


INSERT INTO Distrito (id_provincia, desc_distrito) VALUES (1, 'Miraflores');
INSERT INTO Distrito (id_provincia, desc_distrito) VALUES (1, 'San Isidro');
INSERT INTO Distrito (id_provincia, desc_distrito) VALUES (2, 'Cusco Centro');
INSERT INTO Distrito (id_provincia, desc_distrito) VALUES (3, 'Cayma');
INSERT INTO Distrito (id_provincia, desc_distrito) VALUES (3, 'Yanahuara');
-- En Trujillo
INSERT INTO Distrito (id_provincia, desc_distrito) VALUES (4, 'Centro Histórico');
INSERT INTO Distrito (id_provincia, desc_distrito) VALUES (4, 'Víctor Larco');

INSERT INTO Sede (desc_sede) VALUES ('Sede Central');
INSERT INTO Sede (desc_sede) VALUES ('Sede Regional');
INSERT INTO Sede (desc_sede) VALUES ('Sede Norte');
INSERT INTO Sede (desc_sede) VALUES ('Sede Sur');

INSERT INTO Gerente (desc_gerente) VALUES ('Juan Pérez');
INSERT INTO Gerente (desc_gerente) VALUES ('María López');
INSERT INTO Gerente (desc_gerente) VALUES ('Pedro Ramírez');
INSERT INTO Gerente (desc_gerente) VALUES ('Gabriela Suárez');

INSERT INTO Condicion (desc_condicion) VALUES ('Operativo');
INSERT INTO Condicion (desc_condicion) VALUES ('Mantenimiento');
INSERT INTO Condicion (desc_condicion) VALUES ('Expansión');
INSERT INTO Condicion (desc_condicion) VALUES ('Cerrado Temporalmente');


INSERT INTO Hospital (id_distrito, nombre, antiguedad, area, id_sede, id_gerente, id_condicion) 
VALUES (1, 'Hospital Nacional', 15, 2500.50, 1, 1, 1);

INSERT INTO Hospital (id_distrito, nombre, antiguedad, area, id_sede, id_gerente, id_condicion) 
VALUES (2, 'Clínica San Juan', 8, 1800.75, 2, 2, 2);



-- Hospital en Arequipa (Cayma)
INSERT INTO Hospital (id_distrito, nombre, antiguedad, area, id_sede, id_gerente, id_condicion) 
VALUES (4, 'Hospital Regional de Arequipa', 22, 3500.50, 1, 1, 1);

-- Hospital en Arequipa (Yanahuara)
INSERT INTO Hospital (id_distrito, nombre, antiguedad, area, id_sede, id_gerente, id_condicion) 
VALUES (5, 'Clínica Yanahuara', 10, 2200.00, 2, 2, 1);

-- Hospital en Trujillo (Centro Histórico)
INSERT INTO Hospital (id_distrito, nombre, antiguedad, area, id_sede, id_gerente, id_condicion) 
VALUES (6, 'Hospital Central de Trujillo', 30, 5000.80, 3, 3, 1);


-- Hospital en Trujillo (Víctor Larco)
INSERT INTO Hospital (id_distrito, nombre, antiguedad, area, id_sede, id_gerente, id_condicion) 
VALUES (7, 'Clínica San Pedro', 8, 1800.90, 4, 4, 1);

