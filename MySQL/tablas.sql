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

INSERT INTO Monstruo VALUES ('Fatalis Carmesi','Dragón Anciano',2723);

INSERT INTO Mapa VALUES('Selva Jurásica',15,'Selva');
