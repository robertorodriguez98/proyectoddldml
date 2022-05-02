CREATE DATABASE Monster_Hunter;
USE Monster_Hunter;

-- TABLAS
CREATE TABLE Monstruo(
nombre VARCHAR(20) PRIMARY KEY,
tipo ENUM('Anfibio','Bestia de Colmillos','Carapaceon','Dracoalado','Dragón Anciano','Herbívoro','Leviathan','Lynian','Neopteron','Temnoceran','Wyvern Bruto','Wyvern de Colmillos','Wyvern Nadador','Wyvern Pájaro','Wyvern Serpiente','Wyvern Volador','Monstruos no clasificados'),
tamano DECIMAL(6,2),
CONSTRAINT CK_Monstruos_Nombre CHECK (nombre REGEXP "^(\\s?[A-Z][a-z]*)+$")
);

Create table Mapa(
nombre VARCHAR (20) PRIMARY KEY,
nZonas DECIMAL (2) NOT NULL,
bioma ENUM ('Selva','Desierto','Montaña'),
CONSTRAINT CK_Mapa_nZonas CHECK (nZonas >= 1 AND nZonas <= 20)
);

CREATE TABLE Objeto(
nombre VARCHAR (20) PRIMARY KEY,
mapa_nombre VARCHAR (20),
monstruo_nombre VARCHAR (20),
valor DECIMAL (8,2),
rareza DECIMAL (2),
conseguido DATE,
CONSTRAINT FK_Objetos1 FOREIGN KEY (mapa_nombre) REFERENCES Mapa(nombre),
CONSTRAINT FK_Objetos2 FOREIGN KEY (monstruo_nombre) REFERENCES Monstruo(nombre),
CONSTRAINT CK_Objetos_Rareza CHECK (rareza >= 1 AND rareza <= 10),
CONSTRAINT CK_Objetos_Valor CHECK (valor >= 0 AND valor <= 10000),
CONSTRAINT CK_Objetos_Conseguido CHECK (conseguido BETWEEN '2010-01-01' AND '2022-05-01')
);

-- VALORES

create table Mision(
nombre VARCHAR (20) PRIMARY KEY,
mapa_nombre VARCHAR (20),
monstruo_nombre VARCHAR (20),
rango DECIMAL (2),
descripcion VARCHAR (100) UNIQUE,
recompensa DECIMAL (8,2),
tiempo DECIMAL (2) DEFAULT 30,
CONSTRAINT FK_Mision1 FOREIGN KEY (mapa_nombre) REFERENCES Mapa(nombre),
CONSTRAINT FK_Mision2 FOREIGN KEY (monstruo_nombre) REFERENCES Monstruo(nombre),
CONSTRAINT CK_Mision_Rango CHECK (rango >= 1 AND rango <= 10),
CONSTRAINT CK_Mision_Tiempo CHECK (tiempo >= 1 AND tiempo <= 50),
CONSTRAINT CK_Mision_Recompensa CHECK (recompensa >= 0 AND recompensa <= 10000)
);

CREATE TABLE Equipo(
nombre VARCHAR (20) PRIMARY KEY,
objeto_nombre VARCHAR (20),
rareza DECIMAL (2),
tipo ENUM ('Arma','Armadura'),
elemento ENUM ('Fuego','Rayo','Hielo','Agua','Dragón'),
afilado ENUM ('Rojo','Naranja','Amarillo','Verde','Azul','Blanco','Violeta'),
CONSTRAINT FK_Equipo1 FOREIGN KEY (objeto_nombre) REFERENCES Objeto(nombre),
CONSTRAINT CK_Equipo_Rareza CHECK (rareza >= 1 AND rareza <= 10)
);


INSERT INTO Monstruo VALUES ('Fatalis Carmesi','Dragón Anciano',2723);
INSERT INTO Monstruo VALUES ('Nergigante','Dragón Anciano',3500);
INSERT INTO Monstruo VALUES ('Teostra','Dragón Anciano',2723);
INSERT INTO Monstruo VALUES ('Anjanath','Wyvern Bruto',2723);
INSERT INTO Monstruo VALUES ('Paolumu','Wyvern Volador',2723);
INSERT INTO Monstruo VALUES ('Vaal Hazak','Dragón Anciano',2723);

INSERT INTO Mapa VALUES('Selva Jurásica',15,'Selva');
INSERT INTO Mapa VALUES('Yermo de Agujas',7,'Desierto');
INSERT INTO Mapa VALUES('Altiplanos Coralinos',17,'Selva');
INSERT INTO Mapa VALUES('Valle Putrefacto',10,'Desierto');
INSERT INTO Mapa VALUES('Arroyo de Escarcha',12,'Montaña');

INSERT INTO Objeto VALUES ('Garra de Fatalis','Selva Jurásica','Fatalis Carmesi',1500,5,'2015-01-01');
INSERT INTO Objeto VALUES ('Colmillo de Fatalis','Selva Jurásica','Fatalis Carmesi',2000,7,'2015-01-01');
INSERT INTO Objeto VALUES ('Garra de Anjanath','Selva Jurásica','Anjanath',1000,3,'2015-01-06');
INSERT INTO Objeto VALUES ('Núcleo de Teostra','Yermo de Agujas','Teostra',3000,8,'2015-01-01');
INSERT INTO Objeto VALUES ('Alas de Paolumu','Valle Putrefacto','Paolumu',2500,8,'2017-07-01');

INSERT INTO Mision (nombre,mapa_nombre,monstruo_nombre,rango,descripcion,recompensa) VALUES ('Misión de Fatalis','Selva Jurásica','Fatalis Carmesi',5,'Tienes que Matar a un Fatalis Carmesí',1500);
INSERT INTO Mision (nombre,mapa_nombre,monstruo_nombre,rango,descripcion,recompensa) VALUES ('Mision de Teostra','Yermo de Agujas','Teostra',6,'Tienes que matar a un Teostra',2000);
INSERT INTO Mision (nombre,mapa_nombre,monstruo_nombre,rango,descripcion,recompensa) VALUES ('Mision de Anjanath','Selva Jurásica','Anjanath',2,'Tienes que matar a un Anjanath',750);

INSERT INTO Equipo VALUES ('Arma de Fatalis','Garra de Fatalis',5,'Arma','Fuego','Rojo');
INSERT INTO Equipo VALUES ('Armadura Fatalis','Colmillo de Fatalis',6,'Armadura',NULL,NULL);
INSERT INTO Equipo VALUES ('Hacha de Anjanath','Garra de Anjanath',3,'Arma','Hielo','Naranja');
INSERT INTO Equipo VALUES ('Casco de Teostra','Núcleo de Teostra',9,'Armadura',NULL,NULL);
INSERT INTO Equipo VALUES ('Cornamusa de Paolumu','Alas de Paolumu',2,'Arma','Rayo','Amarillo');

COMMIT;