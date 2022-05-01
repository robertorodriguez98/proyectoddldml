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



INSERT INTO Monstruo VALUES ('Fatalis Carmesi','Dragón Anciano',2723);

INSERT INTO Mapa VALUES('Selva Jurásica',15,'Selva');

INSERT INTO Objeto VALUES ('Garra de Fatalis','Selva Jurásica','Fatalis Carmesi',1500,5,'2015-01-01');
