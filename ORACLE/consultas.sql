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

update Equipo
set afilado = 'Blanco'
where rareza > 4
and tipo = 'Arma';

delete from Mapa
where nombre not in (select mapa_nombre
                    from Objeto);

select m.nombre, sum(o.valor) as total
from Monstruo m, Objeto o
where m.nombre = o.monstruo_nombre
group by m.nombre;

select objeto.monstruo_nombre,equipo.nombre
from Objeto
FULL outer join Equipo On objeto.nombre=equipo.objeto_nombre
order by equipo.nombre;

select mapa.nombre, mision.Nombre
from Mapa right join mision
on mapa.nombre = mision.mapa_nombre
order by mapa.nombre;

select o1.nombre, o1.valor
from Objeto o1
where o1.valor > (select avg(o2.valor)
                    from Objeto o2
                    where o2.monstruo_nombre = o1.monstruo_nombre);

select o.monstruo_nombre
from objeto o
where o.nombre in (select e.objeto_nombre
                    from Equipo e
                    where e.tipo = 'Arma')
and conseguido > TO_DATE('02/01/2015','DD/MM/YYYY');