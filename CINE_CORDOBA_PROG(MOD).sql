CREATE DATABASE CINE_CORDOBA_PROG
GO
USE CINE_CORDOBA_PROG
GO

SET DATEFORMAT dmy


create table Users(
UserID int identity(1,1),
LoginName nvarchar(100) unique not null,
Password nvarchar(100) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
Position nvarchar(100) not null,
Email nvarchar(150) not null
)

insert into Users values('admin','admin','Gerardo','Valdez','Administrador','ger4rdovaldez@gmail.com')




------------ESTADOS--VARIOS----
create table ESTADOS(
id_estado int identity(1,1),
estado varchar(25) not null,
constraint pk_id_estado primary key (id_estado),
)

----------SALAS----------
create table BUTACAS(
id_butaca int identity(1,1),
fila varchar(1) not null,
numero int not null,
constraint pk_butacas primary key(id_butaca)
)

create table TIPOS_SALAS(
id_tipo_sala int identity(1,1),
caracteristica varchar(10) not null,
constraint pk_tipos_salas primary key(id_tipo_sala) 
)

create table SALAS(
id_sala int identity(1,1),
id_tipo_sala int not null,
id_estado int not null,
constraint pk_salas primary key(id_sala),
constraint fk_salas_tipos_salas foreign key(id_tipo_sala) references tipos_salas(id_tipo_sala),
constraint fk_salas_estados foreign key(id_estado) references estados(id_estado)
)

create table DETALLES_SALAS(
id_detalle_sala int identity(1,1),
id_sala int not null,
id_butaca int not null,
descripcion varchar(100) null,
constraint pk_detalles_salas primary key(id_detalle_sala),
constraint fk_detalles_salas_salas foreign key(id_sala) references salas(id_sala),
constraint fk_detalles_salas_butaca foreign key(id_butaca) references butacas(id_butaca),
)

----------VENTA----------
create table FORMAS_COMPRAS(
id_forma_compra int identity(1,1),
forma_compra varchar(25),
descripcion varchar(100),
constraint pk_formas_compras primary key(id_forma_compra),
)

create table FORMAS_PAGOS(
id_forma_pago int identity(1,1),
forma_pago varchar (25) not null,
descripcion varchar(100) null,
constraint pk_formas_pagos primary key(id_forma_pago),
)

create table DESCUENTOS(
id_descuento int identity(1,1),
id_estado int not null,
descuento int not null,
descripcion varchar(100) null,
constraint pk_descuentos primary key(id_descuento),
constraint fk_descuentos_estados foreign key(id_estado) references estados(id_estado),
)

create table COMPROBANTES(
id_comprobante int identity(1,1),
id_forma_pago int not null,
id_forma_compra int not null,
id_descuento int null,
id_estado int not null,
descripcion varchar(100) null,
constraint pk_detalles_comprobantes primary key(id_comprobante),
constraint fk_comprobantes_formas_compras foreign key(id_forma_compra) references formas_compras(id_forma_compra),
constraint fk_detalles_comprobantes_formas_pagos foreign key(id_forma_pago) references formas_pagos(id_forma_pago),
constraint fk_detalles_comprobantes_descuentos foreign key(id_descuento) references descuentos(id_descuento),
constraint fk_detalles_comprobantes_estados foreign key(id_estado) references estados(id_estado),
)

----------FUNCIONES----------
create table CLASIFICACIONES(
id_clasificacion int identity(1,1),
clasificacion varchar(10) not null,
descripcion varchar(100) null,
constraint pk_clasificaciones primary key(id_clasificacion),
)

create table IDIOMAS(
id_idioma int identity(1,1),
idioma varchar(20) not null,
subtitulos varchar(20) not null,
constraint pk_idiomas primary key(id_idioma),
)

create table DIRECTORES(
id_director int identity(1,1),
nombre varchar(50) not null,
fecha_nacimiento datetime null,
constraint pk_directores primary key(id_director),
)

create table PELICULAS(
id_pelicula int identity (1,1),
id_clasificacion int not null,
id_idioma int not null,
id_director int null,
nombre_pelicula varchar(50) not null,
fecha_estreno datetime not null,
constraint pk_peliculas primary key(id_pelicula),
constraint fk_peliculas_clasificaciones foreign key(id_clasificacion) references clasificaciones(id_clasificacion),
constraint fk_peliculas_idiomas foreign key(id_idioma) references idiomas(id_idioma),
constraint fk_peliculas_directores foreign key(id_director) references directores(id_director)
)

create table HORARIOS_FUNCIONES(
id_horario_funcion int identity (1,1),
horario time not null,
descripcion varchar (50) null
constraint pk_horarios_funcoiones primary key(id_horario_funcion),
)

create table FUNCIONES(
id_funcion int identity (1,1),
id_horario_funcion int not null,
id_pelicula int not null,
constraint pk_funciones primary key(id_funcion),
constraint fk_funciones_horarios_funciones foreign key(id_horario_funcion) references horarios_funciones(id_horario_funcion),
constraint fk_funciones_pelicula foreign key(id_pelicula) references peliculas(id_pelicula),
)

----------UNIONES DE TABLAS----------
create table CLIENTES(
id_cliente int identity (1,1),
nombre_cliente varchar(50) not null,
apellido_cliente varchar(50) not null,
genero varchar(20) null,
fecha_alta datetime not null,
fecha_nacimiento datetime null,
constraint pk_clientes primary key(id_cliente),
)

create table ENTRADAS(
id_entrada int identity (1,1),
id_detalle_sala int not null,
id_funcion int not null,
id_cliente int not null,
precio float,
fecha_entrada datetime not null,
constraint pk_entradas primary key(id_entrada),
constraint fk_entradas_detalles_salas foreign key(id_detalle_sala) references detalles_salas(id_detalle_sala),
constraint fk_entradas_funciones foreign key(id_funcion) references funciones(id_funcion),
constraint fk_entradas_clientes foreign key(id_cliente) references clientes(id_cliente),
)

create table DETALLE_COMPROBANTES(
id_detalle_comprobante int identity (1,1),
id_comprobante int not null,
id_entrada int not null,
monto float,
cantidad int,
constraint pk_comprobantes primary key(id_detalle_comprobante),
constraint fk_comprobantes_detalles_comprobantes foreign key(id_comprobante) references COMPROBANTES(id_comprobante),
constraint fk_comprobantes_entradas foreign key(id_entrada) references entradas (id_entrada)
)


---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------INSERTS-----------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
----------- insert ESTADOS --------
INSERT INTO ESTADOS(estado) VALUES ('Habilitado')
INSERT INTO ESTADOS(estado) VALUES ('Desabilitado')
INSERT INTO ESTADOS(estado) VALUES ('Pendiente')
INSERT INTO ESTADOS(estado) VALUES ('Concretado')

------------insert BUTACAS---------------
INSERT INTO BUTACAS(fila,numero) VALUES ('A',1)
INSERT INTO BUTACAS(fila,numero) VALUES ('A',2)
INSERT INTO BUTACAS(fila,numero) VALUES ('A',3)
INSERT INTO BUTACAS(fila,numero) VALUES ('A',4)
INSERT INTO BUTACAS(fila,numero) VALUES ('A',5)
INSERT INTO BUTACAS(fila,numero) VALUES ('B',1)
INSERT INTO BUTACAS(fila,numero) VALUES ('B',2)
INSERT INTO BUTACAS(fila,numero) VALUES ('B',3)
INSERT INTO BUTACAS(fila,numero) VALUES ('B',4)
INSERT INTO BUTACAS(fila,numero) VALUES ('B',5)
INSERT INTO BUTACAS(fila,numero) VALUES ('C',1)
INSERT INTO BUTACAS(fila,numero) VALUES ('C',2)
INSERT INTO BUTACAS(fila,numero) VALUES ('C',3)
INSERT INTO BUTACAS(fila,numero) VALUES ('C',4)
INSERT INTO BUTACAS(fila,numero) VALUES ('C',5)
INSERT INTO BUTACAS(fila,numero) VALUES ('D',1)
INSERT INTO BUTACAS(fila,numero) VALUES ('D',2)
INSERT INTO BUTACAS(fila,numero) VALUES ('D',3)
INSERT INTO BUTACAS(fila,numero) VALUES ('D',4)
INSERT INTO BUTACAS(fila,numero) VALUES ('D',5)
INSERT INTO BUTACAS(fila,numero) VALUES ('E',1)
INSERT INTO BUTACAS(fila,numero) VALUES ('E',2)
INSERT INTO BUTACAS(fila,numero) VALUES ('E',3)
INSERT INTO BUTACAS(fila,numero) VALUES ('E',4)
INSERT INTO BUTACAS(fila,numero) VALUES ('E',5)
INSERT INTO BUTACAS(fila,numero) VALUES ('F',1)
INSERT INTO BUTACAS(fila,numero) VALUES ('F',2)
INSERT INTO BUTACAS(fila,numero) VALUES ('F',3)
INSERT INTO BUTACAS(fila,numero) VALUES ('F',4)
INSERT INTO BUTACAS(fila,numero) VALUES ('F',5)
INSERT INTO BUTACAS(fila,numero) VALUES ('G',1)
INSERT INTO BUTACAS(fila,numero) VALUES ('G',2)
INSERT INTO BUTACAS(fila,numero) VALUES ('G',3)
INSERT INTO BUTACAS(fila,numero) VALUES ('G',4)
INSERT INTO BUTACAS(fila,numero) VALUES ('G',5)
INSERT INTO BUTACAS(fila,numero) VALUES ('H',1)
INSERT INTO BUTACAS(fila,numero) VALUES ('H',2)
INSERT INTO BUTACAS(fila,numero) VALUES ('H',3)
INSERT INTO BUTACAS(fila,numero) VALUES ('H',4)
INSERT INTO BUTACAS(fila,numero) VALUES ('H',5)

----- insert TIPOS_SALAS ---------
INSERT INTO TIPOS_SALAS(caracteristica) VALUES ('2D')
INSERT INTO TIPOS_SALAS(caracteristica) VALUES ('3D')

----- insert SALAS ---------------
INSERT INTO SALAS(id_tipo_sala,id_estado) VALUES (1,1)
INSERT INTO SALAS(id_tipo_sala,id_estado) VALUES (1,1)
INSERT INTO SALAS(id_tipo_sala,id_estado) VALUES (1,2)
INSERT INTO SALAS(id_tipo_sala,id_estado) VALUES (1,2)
INSERT INTO SALAS(id_tipo_sala,id_estado) VALUES (2,1)
INSERT INTO SALAS(id_tipo_sala,id_estado) VALUES (2,2)
INSERT INTO SALAS(id_tipo_sala,id_estado) VALUES (2,2)

----- insert DETALLES_SALAS --------
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,1,'Discapacitados')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,2,'Discapacitados')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,3,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,4,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,5,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,6,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,7,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,8,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,9,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,10,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,11,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,12,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,13,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,14,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,15,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,16,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,17,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,18,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,19,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (1,20,'XL')

INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,1,'Discapacitados')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,2,'Discapacitados')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,3,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,4,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,5,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,6,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,7,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,8,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,9,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,10,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,11,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,12,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,13,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,14,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,15,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,16,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,17,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,18,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,19,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (2,20,'XL')

INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,1,'Discapacitados')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,2,'Discapacitados')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,3,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,4,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,5,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,6,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,7,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,8,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,9,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,10,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,11,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,12,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,13,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,14,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,15,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,16,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,17,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,18,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,19,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,20,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,21,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,22,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,23,'Regular')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,24,'XL')
INSERT INTO DETALLES_SALAS(id_sala,id_butaca,descripcion) VALUES (5,25,'XL')

----- insert FORMAS_COMPRAS --------
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Pagina Web','No Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Boleteria','Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Auto-Boleteria','Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('App','No Presencial')

----- insert FORMAS_PAGOS --------
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Efectivo','Solo en Boleterias')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Tarjeta Debito','Visa, American Express, Mastercard')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Tarjeta Credito','Visa, American Express, Mastercard')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Transferencia Bancaria',null)
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Mercado Pago',null)
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('MODO',null)

----- insert DESCUENTOS --------
INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (1,35,'Jubilados')
INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (1,25,'Menores de 13 Años')
INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (1,15,'Pago con Visa')
INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (2,50,'Especial Aniversario')

----- insert COMPROBANTES --------
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (1, 1, NULL,4,'')     --NO SE QUE PONER EN DESCRIPCION
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (1, 2, 1,4,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (1, 3, 1,3,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (2, 4, NULL,4,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (2, 1, NULL,4,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (2, 2, 3,4,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (2, 3, 2,4,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (3, 1, 3,3,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (3, 2, NULL,4,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (3, 2, NULL,4,'')     --SELECT*FROM DESCUENTOS
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (3, 1, 3,4,'')        --SELECT*FROM FORMAS_PAGOS     
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (4, 2, 1,3,'')        --SELECT*FROM ESTADOS
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (4, 1, 2,4,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (5, 2, NULL,4,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (5, 1, NULL,3,'')
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento,id_estado,descripcion) VALUES (5, 3, 1,4,'')

---- Insert Clasificaciones -------
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('G', 'Apta para todo público')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('PG', 'Guía paternal sugerida')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('PG-13', 'guía paternal estricta para menores de 13 años')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('R', 'Menores de 17 años requiere compañia de padre o tutor adulto')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('NC', 'Nadie de 17 años o menos es admitido')

---- Insert IDIOMAS -------
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Castellano',' ')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Castellano','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Inglés','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Ingles','Sub-Ingles')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Ingles',' ')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Portugues','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Japones','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Frances','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Italiano','Sub-Castellano')

---- Insert DIRECTORES ------- (10)
set dateformat dmy
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Steven Spielberg','18/12/1946')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Christopher Nolan','30/07/1970')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Todd Phillips','20/12/1970')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Adrian Molina','23/08/1985')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Andrew Stanton','03/12/1965')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Bob Peterson','18/01/1961')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Martin Scorsese','17/11/1942')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Lee Unkrich','08/08/1967')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Tim Burton','25/08/1958')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Juan José Campanella','19/07/1959')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Paul Thomas Anderson','26/06/1970')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Quentin Tarantino','27/03/1963')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Francis Ford Coppola','07/04/1939')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('David Fincher','28/08/1962')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Woody Allen','01/12/1935')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Guillermo Del Toro','09/10/1964')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('James Cameron','16/08/1954')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Mel Gibson','03/01/1956')

---- Insert PELICULAS ------- (20)
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (5, 1, 1, 'Tiburon', '31/07/1975') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 1, 1, 'Jurassic Park', '15/07/1993') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (3, 1, 2, 'Batman: El caballero de la noche', '17/07/2008') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 2, 'interstellar', '06/11/2014') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 2, 3, 'Joker', '04/10/2019') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 1, 3, 'Que paso ayer?', '10/08/2009')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 4, 'Coco', '22/11/2017') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 4, 'Un gran dinosaurio', '26/11/2015') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 5, 'WALL-E', '09/07/2008') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 5, 'Buscando a Nemo', '03/07/2003') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 6, 'Up : una aventura de altura', '11/06/2009') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 6, 'Cars', '29/06/2006')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 2, 7, 'El irlandes', '21/11/2019')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 1, 7, 'El lobo de Wall Street', '02/01/2014')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 8, 'Monsters, Inc', '06/12/2001')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 8, 'Toy Story', '14/03/1996')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (2, 1, 9, 'Alicia en el pais de las maravillas', '04/03/2010')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (2, 1, 9, 'Dumbo', '28/03/2019')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 1, 10, 'El secreto de sus ojos', '13/08/2009')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 10, 'Metegol', '18/07/2013')

---- Insert HORARIOS_FUNCIONES ------- (17)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('10:00:00', 'Matutino')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('12:00:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('14:00:00', 'Visita escolar')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('16:00:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('18:00:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('20:00:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('22:00:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('23:00:00', 'Especial Hallowen')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('00:00:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('02:00:00', 'Trasnoche')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('11:30:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('14:30:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('17:30:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('20:30:00', 'Especial San Valentin')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('22:30:00', NULL)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('00:30:00', 'Trasnoche')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('01:30:00', NULL)

---- Insert FUNCIONES -------
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula) VALUES (6,1)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula) VALUES (4,2)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula) VALUES (1,3)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula) VALUES (2,4)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula) VALUES (3,5)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula) VALUES (14,9)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula) VALUES (16,7)

---- Insert CLIENTES ------- 40
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gabriel',  'Santos', 'Masculino', '12/11/2020', '03/02/1960')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Hector', 'Juarez', 'Masculino', '21/01/2017', '22/04/1956')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Raul', 'Campos', 'Masculino', '03/09/2021', '05/02/1985') 
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gaston', 'Perez', 'Masculino', '01/12/2018', '10/06/1993')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Astrid', 'Torres', 'Femenino', '12/10/2016', '10/07/1990')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Laura', 'Sosa', 'Femenino', '01/09/2016', '11/06/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Graciela', 'Carranza', 'Femenino', '29/07/2015', '15/08/1994')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Victoria', 'Giovani', 'Femenino', '12/03/2006', '17/05/1992')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Luna', 'Paez', 'Femenino', '01/04/2004', '07/06/1998')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Cristian', 'Sanchez', 'Masculino', '14/11/2003', '19/04/1991')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Dana', 'Gutierrez', 'Femenino', '13/09/2002', '16/05/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Franco', 'Llorente', 'Masculino', '11/11/2015', '12/01/2000')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gimena', 'Callejos', 'Femenino', '09/07/2010', '17/03/1988')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Fabricio', 'Ruiz', 'Masculino', '18/12/2000', '03/02/1980')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Lucia', 'Acosta', 'Femenino', '18/12/2000', '03/02/1980')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Diego', 'Rojas', 'Masculino', '17/11/2001', '04/03/1981')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Agustina', 'Flores', 'Femenino', '19/10/2002', '06/04/1982')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Maxi', 'Diaz', 'Masculino', '20/09/2003', '03/05/1983')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Florencia', 'Sosa', 'Femenino', '18/08/2004', '06/06/1984')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Nicolas', 'Perez', 'Masculino', '21/07/2005', '07/07/1985')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Raul', 'Salas', 'Masculino', '12/11/2020', '03/02/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Sebastian', 'Paez', 'Masculino', '05/05/2015', '16/05/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Raul', 'Carrasco', 'Masculino', '11/01/2021', '03/06/1990')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gabriel', 'Perez', 'Masculino', '12/10/2020', '03/05/1997')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Ana', 'Torres', 'Femenino', '15/12/2013', '05/02/1998')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Luz', 'Dominguez', 'Femenino', '05/08/2012', '07/06/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Monica', 'Carranza', 'Femenino', '11/07/2014', '08/09/2000')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Victoria', 'Di Bello', 'Femenino', '01/12/2000', '06/05/1980')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Luna', 'Zapata', 'Femenino', '20/11/2020', '03/03/1997')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Cristina', 'Sanchez', 'Femenino', '11/06/2012', '01/08/2005')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Daniela', 'Gutierrez', 'Femenino', '22/12/2020', '03/02/2010')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Mariana', 'Caravajal', 'Femenino', '23/12/2012', '02/09/2001')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gisel', 'Villa', 'Femenino', '11/11/2007', '17/02/1997')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Facundo', 'Rosas', 'Masculino', '26/08/2013', '16/12/2003')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Liz', 'Furtado', 'Femenino', '04/04/2005', '04/04/1996')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Damian', 'Rojas', 'Masculino', '12/11/2020', '03/02/1997')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Andrea', 'Coniglio', 'Femenino', '09/07/2002', '28/10/1990')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Mariano', 'Diaz', 'Masculino', '21/12/2001', '02/04/1988')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Marcela', 'Sauro', 'Femenino', '11/07/2009', '12/09/2001')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Jordy', 'Perez', 'Masculino', '14/02/2016', '04/06/1999')


---- Insert ENTRADAS AGOSTO -------
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente, precio, fecha_entrada) VALUES (5,1,40, 200, '01/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente, precio, fecha_entrada) VALUES (4,2,39, 300, '01/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente, precio, fecha_entrada) VALUES (3,3,38, 400, '01/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente, precio, fecha_entrada) VALUES (2,4,37, 500, '01/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente, precio, fecha_entrada) VALUES (1,5,36, 250, '01/08/2022') 
/*
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,6,35,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,7,34,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,7,33,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,6,32,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,5,31,'02/08/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,3,30,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (35,4,29,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (42,2,28,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (31,1,27,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (15,2,26,'03/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (64,3,25,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (44,4,24,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (34,5,23,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (26,3,22,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (15,2,21,'04/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,1,20,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,2,19,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,3,18,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,4,17,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,7,16,'05/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (13,7,15,'06/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (23,6,14,'06/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (33,5,13,'06/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (46,4,12,'06/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (55,6,11,'06/08/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (49,7,10,'07/08/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (38,7,9,'07/08/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (27,3,8,'07/08/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (36,2,7,'07/08/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (25,2,6,'07/08/2022')     


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,3,5,'08/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,2,4,'08/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,5,3,'08/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,6,2,'08/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,4,1,'08/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (16,3,38,'09/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (24,2,32,'09/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (33,1,34,'09/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (42,4,21,'09/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (41,5,22,'09/08/2022')



INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,2,39,'10/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,1,37,'10/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,3,23,'10/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,4,17,'10/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,5,16,'10/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (10,3,18,'11/08/2022')    
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (11,3,33,'11/08/2022')    
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (12,2,21,'11/08/2022')    
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (13,1,11,'11/08/2022')    
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (14,3,40,'11/08/2022')    


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (15,5,31,'12/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (16,3,38,'12/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (17,2,1,'12/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (18,1,2,'12/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (19,1,3,'12/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (20,3,4,'12/08/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (21,4,4,'13/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (22,5,26,'13/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (23,2,40,'13/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (24,2,40,'13/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (25,1,27,'13/08/2022') 

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (26,4,13,'14/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (27,5,4,'14/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (28,6,5,'14/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (29,7,7,'14/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (30,4,24,'14/08/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (31,3,30,'15/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (32,2,30,'15/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (33,4,32,'15/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (34,5,2,'15/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (35,6,24,'15/08/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (36,1,32,'16/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (37,3,11,'16/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (38,4,15,'16/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (39,5,19,'16/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (40,7,23,'16/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (41,7,38,'16/08/2022') 

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (42,6,39,'17/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (43,5,39,'17/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (44,4,12,'17/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (45,5,34,'17/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (46,6,21,'17/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (47,7,28,'17/08/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (48,4,27,'18/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (49,2,26,'18/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (50,2,12,'18/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (51,4,25,'18/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (52,6,24,'18/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (53,7,25,'18/08/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (54,6,25,'19/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (55,4,21,'19/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,3,23,'19/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (57,3,12,'19/08/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (58,5,23,'19/08/2022') 

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (59,6,21,'20/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (60,7,23,'20/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (61,5,34,'20/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (62,4,40,'20/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (63,3,12,'20/08/2022')





INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (64,2,16,'21/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,4,26,'21/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,5,36,'21/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,6,27,'21/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (34,7,12,'21/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,5,17,'21/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (58,4,35,'22/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (39,3,25,'22/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,7,15,'22/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (13,7,34,'22/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (22,5,24,'22/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (31,5,14,'22/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (45,4,33,'23/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (37,6,13,'23/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (24,2,3,'23/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (12,3,7,'23/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (64,4,1,'23/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (63,5,3,'23/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (41,6,1,'24/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (27,4,2,'24/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (15,7,3,'24/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (24,7,4,'24/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (48,6,5,'24/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (27,5,6,'24/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (34,2,7,'25/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (33,4,8,'25/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (32,6,9,'25/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (25,3,10,'25/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (17,3,11,'25/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (45,3,12,'25/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (33,1,13,'26/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (22,2,14,'26/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (15,3,15,'26/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (27,4,16,'26/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (38,5,17,'26/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (46,6,18,'26/08/2022')



INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,7,19,'27/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,1,20,'27/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,2,21,'27/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,3,22,'27/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,4,23,'27/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,5,24,'27/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (13,6,25,'28/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (35,7,26,'28/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (42,7,27,'28/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,6,28,'28/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,5,29,'28/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,4,30,'28/08/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (15,3,31,'29/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (23,2,32,'29/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (38,1,33,'29/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (47,3,34,'29/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,5,35,'29/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,6,36,'29/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (29,1,37,'30/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (18,2,38,'30/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (37,3,39,'30/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,4,40,'30/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,5,34,'30/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (44,6,32,'30/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,7,12,'31/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,6,19,'31/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,5,18,'31/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,4,27,'31/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,3,32,'31/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,2,35,'31/08/2022')


---- Insert ENTRADAS SEPTIEMBRE -------

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (22,1,13,'01/08/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (43,2,12,'01/08/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (24,3,11,'01/08/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (35,4,10,'01/08/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (14,5,9,'01/08/2022')    
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (25,6,8,'01/08/2022')     


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (38,2,7,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (45,3,6,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (13,4,5,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (51,5,4,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (33,6,3,'02/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (24,7,2,'02/08/2022')



INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (25,5,1,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (16,5,3,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (27,5,5,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (34,4,6,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (42,3,7,'03/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (55,2,29,'03/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,4,28,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,5,27,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,6,26,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,4,25,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,3,24,'04/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,2,23,'04/08/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,3,22,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,5,21,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,6,15,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,4,14,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,6,13,'05/08/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,6,12,'05/08/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,4,16,'06/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,3,17,'06/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,5,18,'06/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,6,19,'06/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,4,20,'06/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,3,21,'06/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,3,31,'07/09/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,5,32,'07/09/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,3,34,'07/09/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,2,6,'07/09/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,4,4,'07/09/2022')     
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,5,3,'07/09/2022')     

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,6,28,'08/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,4,26,'08/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (34,3,25,'08/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,3,24,'08/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,2,21,'08/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,3,18,'08/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,4,17,'09/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (26,2,15,'09/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,3,14,'09/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,5,13,'09/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,4,32,'09/09/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,2,2,'10/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (38,3,4,'10/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,4,5,'10/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (16,5,6,'10/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,6,7,'10/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,6,8,'10/09/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,2,3,'11/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (35,4,2,'11/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,5,4,'11/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,6,32,'11/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (46,6,16,'11/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,4,22,'12/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,5,24,'12/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,4,23,'12/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,3,38,'12/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,3,3,'12/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,3,33,'13/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,6,36,'13/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,6,34,'13/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,7,27,'13/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,7,1,'13/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,7,2,'13/09/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,5,40,'14/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,6,39,'14/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,4,38,'14/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,3,37,'14/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,4,36,'14/09/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,2,21,'15/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,3,22,'15/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,5,23,'15/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (44,6,24,'15/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,7,25,'15/09/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,2,10,'16/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (63,3,11,'16/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,5,12,'16/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,7,1,'16/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (45,3,6,'16/09/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,2,14,'17/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,2,14,'17/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,5,23,'17/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,7,21,'17/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,7,15,'17/09/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,6,17,'18/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,5,23,'18/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,4,1,'18/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,3,7,'18/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,1,3,'18/09/2022') 


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,7,4,'19/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,6,5,'19/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,5,6,'19/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,4,4,'19/09/2022') 
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,3,10,'19/09/2022') 

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,2,3,'20/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,3,12,'20/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,4,32,'20/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,5,4,'20/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (54,6,5,'20/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,7,2,'20/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,7,5,'21/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (14,6,2,'21/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (26,5,15,'21/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,4,2,'21/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (43,3,5,'21/09/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,1,24,'22/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (47,2,16,'22/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,3,2,'22/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (38,4,1,'22/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,5,2,'22/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,6,4,'23/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,5,2,'23/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (35,4,12,'23/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,3,3,'23/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (34,2,19,'23/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,1,5,'23/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,2,15,'24/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,3,34,'24/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,3,12,'24/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,5,32,'24/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,6,40,'24/09/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,1,25,'25/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (27,2,26,'25/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (18,3,27,'25/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (44,4,28,'25/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (22,5,29,'25/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (55,6,30,'25/09/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,7,32,'26/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (36,5,33,'26/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (47,4,34,'26/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,3,35,'26/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (24,2,36,'26/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,1,37,'26/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,2,38,'27/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,3,39,'27/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,4,40,'27/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (63,5,1,'27/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,6,2,'27/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (65,7,3,'27/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,4,4,'27/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,7,5,'28/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,6,6,'28/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,5,7,'28/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,4,8,'28/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,3,9,'28/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,2,10,'28/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (6,2,11,'29/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,3,12,'29/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,4,13,'29/09/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,6,14,'30/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,5,15,'30/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,4,16,'30/09/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,3,17,'30/09/2022')



---- Insert ENTRADAS OCTUBRE -------

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,1,32,'01/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,1,32,'01/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,1,32,'01/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,1,32,'01/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,1,32,'01/10/2022')


INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,3,15,'02/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,4,14,'02/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,5,13,'02/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (45,6,12,'02/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,2,11,'02/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (57,1,10,'02/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (48,4,9,'02/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (36,5,8,'02/10/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,6,7,'03/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (23,5,6,'03/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (44,6,5,'03/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (45,7,4,'03/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,7,3,'03/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (25,5,2,'03/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,4,20,'03/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,3,1,'03/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (54,5,32,'03/10/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,3,10,'04/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (63,4,20,'04/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,5,30,'04/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (55,6,40,'04/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (4,7,27,'04/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (26,4,37,'04/10/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (1,3,21,'05/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (3,2,22,'05/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (47,4,23,'05/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (5,6,24,'05/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (56,7,25,'05/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (35,7,26,'05/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (2,7,27,'05/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (44,5,28,'05/10/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (11,3,29,'06/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (22,2,30,'06/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (33,4,31,'06/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (44,1,32,'06/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (59,1,33,'06/10/2022')

INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (28,4,34,'07/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (37,4,35,'07/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (36,4,36,'07/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (45,4,37,'07/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (54,4,38,'07/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (53,4,39,'07/10/2022')
INSERT INTO ENTRADAS(id_detalle_sala,id_funcion,id_cliente,fecha_entrada) VALUES (12,4,40,'07/10/2022')

*/


---- Insert DETALLLE_COMPROBANTES -------
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (1, 1, 200.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (2, 2, 300, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (3, 3, 200, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (4, 4, 300, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (5, 5, 300.50, 1)    --SELECT*FROM FORMAS_COMPRAS
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (6, 1, 300.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (7, 2, 300.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (8, 3, 200.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (9, 4, 500.00, 2)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (10, 5, 300.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (11, 1, 200.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (12, 2, 500.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (13, 3, 600.50, 3)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (14, 4, 200.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (15, 5, 200.50, 1)
INSERT INTO DETALLE_COMPROBANTES(id_comprobante,id_entrada, monto, cantidad) VALUES (16, 1, 200.50, 1)









