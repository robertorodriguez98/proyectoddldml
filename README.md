# Proyecto DDL y DML

# ENUNCIADO Esquema
Debes crear un esquema relacional de una temática de tu interés con al menos 5 tablas.
En las tablas debe haber:
* Al menos datos de los tipos principales (textos, números y fechas).
* Restricciones de:
    * Clave primaria
    * Clave ajena
    * De obligatoriedad
    * Valor por defecto
    * Verificación de condiciones en las que emplees funciones, operadores y expresiones regulares.
    * Unicidad
## Esquema relacional
![](monstruos.png)
### Tablas
#### Monstruo
| Campo | Tipo de datos | Restricciones |
|:-----:|:------------:|:------------:|
| nombre | varchar2(20) | clave primaria, debe estar compuesto solo por letras y cada palabra tiene que empezar por mayúsculas (ej: Zorah Magdaros) |
| tipo | varchar2(20)   | enum |
| tamaño | decimal | entre 100 y 3000 |
#### Mapa
| Campo | Tipo de datos | Restricciones |
|:-----:|:------------:|:------------:|
| nombre | varchar2(20) | clave primaria |
| nZonas | int | entre 1 y 20 , obligatorio|
| bioma | varchar2(20) | enum |
#### Objeto
| Campo | Tipo de datos | Restricciones |
|:-----:|:------------:|:------------:|
| nombre | varchar2(20) | clave primaria |
| Mapa_nombre | varchar2(20) | clave ajena |
| Monstruo_nombre | varchar2(20) | clave ajena |
| valor | decimal | entre 0 y 10000 |
| rareza | int | entre 1 y 10 |
| conseguido | fecha | entre 2010-01-01 y hoy |
#### Misión
| Campo | Tipo de datos | Restricciones |
|:-----:|:------------:|:------------:|
| nombre | varchar2(20) | clave primaria |
| Mapa_nombre | varchar2(20) | clave ajena |
| Monstruo_nombre | varchar2(20) | clave ajena |
| rango | int | entre 1 y 10 |
| descripcion | varchar2(100) | Única |
| recompensa | decimal | entre 0 y 10000 |
| tiempo | int | menor que 50,  por defecto 30 |
#### Equipo
| Campo | Tipo de datos | Restricciones |
|:-----:|:------------:|:------------:|
| nombre | varchar2(20) | clave primaria |
| Objeto_nombre | varchar2(20) | clave ajena |
| rareza | int | entre 1 y 10 |
| tipo | varchar2(20) | enum |
| elemento | varchar2(20) | enum |
| afilado | varchar2(20) | enum |