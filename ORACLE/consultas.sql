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

insert into Monstruo values('Fatalis Verde','Dragón Anciano',2723,'-1');