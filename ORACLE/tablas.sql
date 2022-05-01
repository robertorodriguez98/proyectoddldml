CREATE TABLE Monstruo(
nombre VARCHAR(20),
tipo VARCHAR(20),
tamano DECIMAL(6,2),
CONSTRAINT PK_Monstruos PRIMARY KEY (NOMBRE),
CONSTRAINT CK_Monstruos_Tipo CHECK (TIPO IN ('Anfibio','Bestia de Colmillos','Carapaceon','Dracoalado','Dragón Anciano','Herbívoro','Leviathan','Lynian','Neopteron','Temnoceran','Wyvern Bruto','Wyvern de Colmillos','Wyvern Nadador','Wyvern Pájaro','Wyvern Serpiente','Wyvern Volador','Monstruos no clasificados')),
CONSTRAINT CK_Monstruos_Nombre CHECK (REGEXP_LIKE(nombre,'^(\s?[A-Z][a-z]*)+$'))
);

INSERT INTO Monstruo VALUES ('Fatalis Carmesi','Dragón Anciano',2723);

CREATE TABLE Mapa(
nombre VARCHAR2 (20),
nZonas DECIMAL (2) NOT NULL,
bioma VARCHAR2 (20),
CONSTRAINT PK_Mapa PRIMARY KEY (nombre),
CONSTRAINT CK_Mapa_nZonas CHECK (nZonas >= 1 AND nZonas <= 20),
CONSTRAINT CK_Mapa_Bioma CHECK (BIOMA IN ('Selva','Desierto','Montaña'))
);

INSERT INTO Mapa VALUES('Selva Jurásica',15,'Selva');

