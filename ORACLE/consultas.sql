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

select nombre
from Equipo
where Objeto_nombre in (select nombre
                        from Objeto
                        where monstruo_nombre= 'Fatalis Carmesi');

select sum(valor)
from Objeto o, Mision m
where o.monstruo_nombre = m.monstruo_nombre
and m.mapa_nombre = 'Selva Jurásica';

