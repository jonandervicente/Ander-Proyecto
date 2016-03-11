
DROP TABLE Centro CASCADE CONSTRAINTS;
DROP TABLE Trabajador CASCADE CONSTRAINTS;
DROP TABLE Administracion CASCADE CONSTRAINTS;
DROP TABLE Logistica CASCADE CONSTRAINTS;
DROP TABLE Parte CASCADE CONSTRAINTS;
DROP TABLE Abierto CASCADE CONSTRAINTS;
DROP TABLE Cerrado CASCADE CONSTRAINTS;
DROP TABLE modifica CASCADE CONSTRAINTS;
DROP TABLE Viaje CASCADE CONSTRAINTS;


CREATE TABLE Centro (
    id_centro VARCHAR2 (10) NOT NULL,
    nombre    VARCHAR2 (15) NOT NULL,
    tlf_fijo  VARCHAR2 (9) NOT NULL,
    cp        VARCHAR2 (5) NOT NULL,
    provincia VARCHAR2 (10) NOT NULL,
    ciudad    VARCHAR2 (15) NOT NULL,
    calle     VARCHAR2 (30) NOT NULL,
    numero    VARCHAR2 (3) NOT NULL
);
ALTER TABLE Centro ADD CONSTRAINT Centro_PK PRIMARY KEY (id_centro);


CREATE TABLE Trabajador (
    dni          VARCHAR2 (9) NOT NULL,
    nombre       VARCHAR2 (15) NOT NULL,
    apellido1    VARCHAR2 (20) NOT NULL,
    apellido2    VARCHAR2 (20) NOT NULL,
    calle        VARCHAR2 (30) NOT NULL,
    numero       VARCHAR2 (3) NOT NULL,
    piso         VARCHAR2 (3) NOT NULL,
    mano         VARCHAR2 (5) NOT NULL,
    tlf_empresa  VARCHAR2 (9) NOT NULL,
    tlf_personal VARCHAR2 (9),
    fecha_nac    DATE,
    salario      FLOAT (9),
    Centro_id_centro VARCHAR2 (10) NOT NULL
);
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_PK PRIMARY KEY (dni);


CREATE TABLE Administracion (
    dni VARCHAR2 (9) NOT NULL
);
ALTER TABLE Administracion ADD CONSTRAINT Administracion_PK PRIMARY KEY (dni);


CREATE TABLE Logistica (
    dni VARCHAR2 (9) NOT NULL
);
ALTER TABLE Logistica ADD CONSTRAINT Logistica_PK PRIMARY KEY (dni);


CREATE TABLE Parte (
    id_parte      VARCHAR2 (10) NOT NULL,
    fecha_inicio  DATE NOT NULL,
    km_inicio     FLOAT (10) NOT NULL,
    km_fin        FLOAT (10) NOT NULL,
    gasoil        FLOAT (5),
    autopista     FLOAT (5),
    dieta         FLOAT (5),
    otros         FLOAT (5),
    incidencias   VARCHAR2 (500),
    Logistica_dni VARCHAR2 (9) NOT NULL
);
ALTER TABLE Parte ADD CONSTRAINT Parte_PK PRIMARY KEY (id_parte);


CREATE TABLE Abierto (
    id_parte VARCHAR2 (10) NOT NULL
);
ALTER TABLE Abierto ADD CONSTRAINT Abierto_PK PRIMARY KEY (id_parte);


CREATE TABLE Cerrado (
    id_parte           VARCHAR2 (10) NOT NULL,
    validacion         CHAR (1) NOT NULL,
    fecha_fin          DATE NOT NULL,
    Administracion_dni VARCHAR2 (9) NOT NULL
);
ALTER TABLE Cerrado ADD CONSTRAINT Cerrado_PK PRIMARY KEY (id_parte);


CREATE TABLE modifica (
    Administracion_dni VARCHAR2 (9) NOT NULL,
    Parte_id_parte     VARCHAR2 (10) NOT NULL,
    fecha_modif        DATE NOT NULL
);
ALTER TABLE modifica ADD CONSTRAINT modifica_PK PRIMARY KEY (Administracion_dni, Parte_id_parte);


CREATE TABLE Viaje (
    id_viaje       VARCHAR2 (10) NOT NULL,
    hora_inicio    VARCHAR2 (5) NOT NULL,
    hora_fin       VARCHAR2 (5) NOT NULL,
    matricula      VARCHAR2 (9) NOT NULL,
    num_albaran    VARCHAR2 (10) NOT NULL,
    Parte_id_parte VARCHAR2 (10) NOT NULL
);
ALTER TABLE Viaje ADD CONSTRAINT Viaje_PK PRIMARY KEY (id_viaje);


ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_Centro_FK FOREIGN KEY (Centro_id_centro)
REFERENCES Centro (id_centro) ON DELETE CASCADE;

ALTER TABLE Administracion ADD CONSTRAINT Administracion_Trabajador_FK FOREIGN KEY (dni)
REFERENCES Trabajador (dni);

ALTER TABLE Logistica ADD CONSTRAINT Logistica_Trabajador_FK FOREIGN KEY (dni)
REFERENCES Trabajador (dni);

ALTER TABLE Parte ADD CONSTRAINT Parte_Logistica_FK FOREIGN KEY (Logistica_dni)
REFERENCES Logistica (dni) ON DELETE CASCADE;

ALTER TABLE Abierto ADD CONSTRAINT Abierto_Parte_FK FOREIGN KEY (id_parte)
REFERENCES Parte (id_parte);

ALTER TABLE Cerrado ADD CONSTRAINT Cerrado_Administracion_FK FOREIGN KEY (Administracion_dni)
REFERENCES Administracion (dni) ON DELETE CASCADE;

ALTER TABLE Cerrado ADD CONSTRAINT Cerrado_Parte_FK FOREIGN KEY (id_parte)
REFERENCES Parte (id_parte);

ALTER TABLE modifica ADD CONSTRAINT FK_ASS_6 FOREIGN KEY (Administracion_dni)
REFERENCES Administracion (dni) ON DELETE CASCADE;

ALTER TABLE modifica ADD CONSTRAINT FK_ASS_7 FOREIGN KEY (Parte_id_parte)
REFERENCES Parte (id_parte) ON DELETE CASCADE;

ALTER TABLE Viaje ADD CONSTRAINT Viaje_Parte_FK FOREIGN KEY (Parte_id_parte)
REFERENCES Parte (id_parte) ON DELETE CASCADE;


INSERT INTO Centro VALUES ('111111111','Primero','945155636','01001','Alava','Vitoria-Gasteiz','calle Postas','7');
INSERT INTO Centro VALUES ('222222222','Segundo','943135619','03003','Pontevedra','Sanxenxo','calle Rua Castelao','13');
INSERT INTO Centro VALUES ('333333333','Tercero','941564578','01204','Madrid','Madrid','Gran Via','48');
INSERT INTO Centro VALUES ('444444444','Cuarto','947321465','06004','Sevilla','Sevilla','calle Ramon Carande','24');
INSERT INTO Centro VALUES ('555555555','Quinto','948257621','03507','Barcelona','Sabadell','carrer del Valles','30');


INSERT INTO Trabajador VALUES ('11111111A','Aritz','Garcia','Martinez','calle Perdida','1','1','Dcha','645783521','694525315','21/03/1990',999.99,'111111111');
INSERT INTO Trabajador VALUES ('22222222B','Amaia','Gomez','Pereda','calle Nula','4','2','Izqu','612785432','698452135','12/11/1895',999.99,'111111111');
INSERT INTO Trabajador VALUES ('33333333C','Jon','Fernandez','Larrinoa','calle Salida','7','3','Dcha','678541235','698523214','02/09/1893',999.99,'222222222');
INSERT INTO Trabajador VALUES ('44444444D','Ane','Anton','Salazar','calle Arriaga','11','4','Izqu','687521432','698532147','06/05/1892',999.99,'222222222');
INSERT INTO Trabajador VALUES ('55555555E','Markel','Madina','Roldan','calle Alacala','15','5','Dcha','678521456','698632564','15/08/1890',999.99,'333333333');
INSERT INTO Trabajador VALUES ('66666666F','Naia','Azkorreta','Gutierrez','calle Paz','1','6','Izqu','689452512','632124574','08/06/1998',999.99,'333333333');
INSERT INTO Trabajador VALUES ('77777777G','Nicolas','Masvidal','Cuesta','calle Erre','1','7','Dcha','645127898','632541278','16/09/1991',999.99,'444444444');
INSERT INTO Trabajador VALUES ('88888888H','Leire','Munar','Bengoa','calle Zapa','1','8','Izqu','698572514','678523659','30/10/1995',999.99,'444444444');
INSERT INTO Trabajador VALUES ('99999999I','Aimar','Corres','Bueno','calle Kutxi','1','9','Dcha','698542132','698632589','11/05/1993',999.99,'555555555');
INSERT INTO Trabajador VALUES ('00000000J','Hodei','Quintas','Prieto','calle Pinto','1','10','Izqu','698523258','689452132','26/08/1999',999.99,'555555555');


INSERT INTO Logistica VALUES ('11111111A');
INSERT INTO Logistica VALUES ('33333333C');
INSERT INTO Logistica VALUES ('55555555E');
INSERT INTO Logistica VALUES ('77777777G');
INSERT INTO Logistica VALUES ('99999999I');


INSERT INTO Administracion VALUES ('22222222B');
INSERT INTO Administracion VALUES ('44444444D');
INSERT INTO Administracion VALUES ('66666666F');
INSERT INTO Administracion VALUES ('88888888H');
INSERT INTO Administracion VALUES ('00000000J');



