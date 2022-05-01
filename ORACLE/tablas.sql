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

CREATE TABLE Objeto(
nombre VARCHAR2 (20),
mapa_nombre VARCHAR2 (20),
monstruo_nombre VARCHAR2 (20),
valor DECIMAL (8,2),
rareza DECIMAL(2),
conseguido DATE,
CONSTRAINT PK_Objetos PRIMARY KEY (nombre),
CONSTRAINT FK_Objetos1 FOREIGN KEY (mapa_nombre) REFERENCES Mapa(nombre),
CONSTRAINT FK_Objetos2 FOREIGN KEY (monstruo_nombre) REFERENCES Monstruo(nombre),
CONSTRAINT CK_Objetos_Rareza CHECK (rareza >= 1 AND rareza <= 10),
CONSTRAINT CK_Objetos_Valor CHECK (valor >= 0 AND valor <= 10000),
CONSTRAINT CK_Objetos_Conseguido CHECK (conseguido > TO_DATE('01/01/2010','DD/MM/YYYY') AND Conseguido <= TO_DATE('01/05/2022','DD/MM/YYYY') )
);

INSERT INTO Objeto VALUES ('Garra de Fatalis','Selva Jurásica','Fatalis Carmesi',1500,5,TO_DATE('01/01/2015','DD/MM/YYYY'));
