-- Modificaciones de las tablas

alter table Monstruo
add peso DECIMAL (8,2);

alter table Monstruo
modify column peso VARCHAR(11);

alter table Monstruo
add constraint CK_Monstruo_Peso CHECK (peso >= 0);


