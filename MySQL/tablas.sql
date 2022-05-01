CREATE DATABASE Monster_Hunter;
USE Monster_Hunter;

-- TABLAS
CREATE TABLE Monstruo(
nombre VARCHAR(20) PRIMARY KEY,
tipo ENUM('Anfibio','Bestia de Colmillos','Carapaceon','Dracoalado','Dragón Anciano','Herbívoro','Leviathan','Lynian','Neopteron','Temnoceran','Wyvern Bruto','Wyvern de Colmillos','Wyvern Nadador','Wyvern Pájaro','Wyvern Serpiente','Wyvern Volador','Monstruos no clasificados'),
tamano DECIMAL(6,2),
CONSTRAINT CK_Monstruos_Nombre CHECK (nombre REGEXP "^( ?[A-Z][a-z]*)+$")
);

INSERT INTO Monstruo VALUES ('Fatalis Carmesi','Dragón Anciano',2723);
INSERT INTO Monstruo VALUES ('fatalis carmesi','Dragón Anciano',2723);
INSERT INTO Monstruo VALUES ('Fatalis7 Carmesi','Dragón Anciano',2723);
