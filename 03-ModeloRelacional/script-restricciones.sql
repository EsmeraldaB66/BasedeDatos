--crear la base de datos bddireccionesa 
CREATE DATABASE bdrestricciones;
--crea la tabla categoria sin restricciones 
CREATE TABLE categoria(
categoriaid int null,
nombre nvarchar(50)
);
--revisar los datos de la categoria
SELECT * FROM categoria;
--agregar registro a la tabla categoria
INSERT INTO categoria 
VALUES (1,'Carnes Frias');
INSERT INTO categoria 
VALUES (2,'Linea Blanca');
INSERT INTO categoria 
VALUES (1,'Carnes Frias');
--eliminar todos los datos 
DELETE FROM categoria;
--eliminar la tabbla categoria 
DROP TABLE categoria;
CREATE TABLE categoria(
categoriaid int not null,
nombrecategoria nvarchar(50) not null,
constraint pk_categoria
primary key (categoriaid)
);
INSERT INTO categoria 
VALUES (1,'Carnes Frias');
INSERT INTO categoria 
VALUES (2,'Linea Blanca');
INSERT INTO categoria 
VALUES (3,'Dulces');
--Eliminar la tabla 
CREATE TABLE categoria(
categoriaid int not null,
nombrecategoria nvarchar(50) not null,
constraint pk_categoria
primary key (categoriaid),
CONSTRAINT unico_nombrecategoria
unique (nombrecategoria)
);
INSERT INTO categoria 
VALUES (1,'Carnes Frias');
INSERT INTO categoria 
VALUES (2,'Linea Blanca');
INSERT INTO categoria 
VALUES (3,'Dulces');
INSERT INTO categoria 
VALUES (4,'Dulces');
--crear la tablaproductos
CREATE TABLE productos(
productoid int not null,
nombreproducto nvarchar (50) not null,
precio money not null,
existencia int not null,
constraint pk_producto
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check (precio>=1 and precio<=3000),
constraint chk_existencia
check (existencia>=1)
);
INSERT INTO productos
VALUES(1,'Don Julio',3000,56);
INSERT INTO productos
VALUES(2,'Don Julio2',3000,56);
INSERT INTO productos
VALUES(3,'Don Julio3',3000,56);
INSERT INTO productos
VALUES(4,'Terrible Mezcal',1,56);
INSERT INTO productos
VALUES(5,'Terrible Mezcalito',1,3001);
SELECT * FROM productos;
DROP TABLE productos;
CREATE TABLE productos(
productoid int not null,
nombreproducto nvarchar (50) not null,
precio money not null,
existencia int not null,
categoriaid int,
constraint pk_producto
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check (precio>=1 and precio<=3000),
constraint chk_existencia
check (existencia>=1)
);
DELETE categoria;
DROP TABLE productos;
CREATE TABLE productos(
productoid int not null,
nombreproducto nvarchar (50) not null,
precio money not null,
existencia int not null,
constraint pk_producto
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check (precio>=1 and precio<=3000),
constraint chk_existencia
check (existencia>=1),
constraint fk_productos_categoria
foreign key(categoriaid)
references categoria(categoriaid)
);