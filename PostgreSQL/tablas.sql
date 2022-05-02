--TABLAS

CREATE TABLE Monstruo(
nombre VARCHAR(20) PRIMARY KEY,
tipo VARCHAR(20),
tamano DECIMAL(6,2),
CONSTRAINT CK_Monstruos_Tipo CHECK (TIPO IN ('Anfibio','Bestia de Colmillos','Carapaceon','Dracoalado','Dragón Anciano','Herbívoro','Leviathan','Lynian','Neopteron','Temnoceran','Wyvern Bruto','Wyvern de Colmillos','Wyvern Nadador','Wyvern Pájaro','Wyvern Serpiente','Wyvern Volador','Monstruos no clasificados')),
CONSTRAINT CK_Monstruos_Nombre CHECK (nombre ~ '^(\s?[A-Z][a-z]*)+$')
);

INSERT INTO Monstruo VALUES ('Fatalis Carmesi','Dragón Anciano',2723);

