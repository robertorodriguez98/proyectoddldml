-- Modificaciones de las tablas

alter table Monstruo
add peso DECIMAL (8,2);

ALTER TABLE Monstruo
ALTER COLUMN peso TYPE VARCHAR(11);

alter table Monstruo
add constraint CK_Monstruo_Peso CHECK (CAST(peso AS DECIMAL) >= 0);

alter table Monstruo
drop constraint CK_Monstruo_Peso;

alter table Monstruo
drop column peso;

-- Consultas

