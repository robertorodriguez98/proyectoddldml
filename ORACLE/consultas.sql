-- Modificaciones de las tablas

alter table Monstruo
add peso DECIMAL (8,2);

alter table Monstruo
modify(
    peso VARCHAR2(11)
);

alter table Monstruo
add constraint CK_Monstruo_Peso CHECK (TO_NUMBER(peso) >= 0);

alter table Monstruo
disable constraint CK_Monstruo_Peso;

alter table Monstruo
enable constraint CK_Monstruo_Peso;

alter table Monstruo
drop constraint CK_Monstruo_Peso;

alter table Monstruo
drop column peso;

-- Consultas

select nombre from Monstruo;

create view valor_objetos as
select nombre, valor from Objeto;

