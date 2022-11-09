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




-------------------------------------------PROCEDIMIENTOS ALMACENADOS----------------------------------

--SP CONSULTAR ENTRADAS
GO
CREATE PROC SP_CONSULTAR_ENTRADAS
AS
BEGIN
	
	SELECT * from ENTRADAS;
END

GO
--INSERTAR MAESTRO
CREATE PROC SP_INSERTAR_MAESTRO
	@idFormaPago INT,
	@idFormaCompra INT,
	@idDescuento INT,
	@idEstado INT,
	@descripcion varchar (100),
	@comprobante_nro int OUTPUT
AS
BEGIN
	INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_descuento, id_estado, descripcion)
    VALUES (@idFormaPago, @idFormaCompra, @idDescuento, @idEstado, @descripcion);
    --Asignamos el valor del último ID autogenerado (obtenido --  
    --mediante la función SCOPE_IDENTITY() de SQLServer)	
    SET @comprobante_nro = SCOPE_IDENTITY();
END

GO
--SP_INSERTAR_DETALLE
CREATE PROC SP_INSERTAR_DETALLE 
	@idComprobante int,
	@idEntrada int, 
	@monto float, 
	@cantidad int
AS
BEGIN
	INSERT INTO DETALLE_COMPROBANTES(id_comprobante, id_entrada, monto, cantidad)
    VALUES (@idComprobante, @idEntrada, @monto, @cantidad); 
END

GO

--SP_ELIMINAR_COMPROBANTE
CREATE PROC BORRAR_COMPROBANTE
	@comprobante_nro int
AS
BEGIN
	DELETE 
	FROM DETALLE_COMPROBANTES
	WHERE id_comprobante = @comprobante_nro

	DELETE 
	FROM COMPROBANTES
	WHERE id_comprobante = @comprobante_nro
END



GO


--MODIFICAR MAESTRO
CREATE PROC SP_MODIFICAR_MAESTRO
	@idFormaPago INT,
	@idFormaCompra INT,
	@idDescuento INT,
	@idEstado INT,
	@descripcion varchar (100),
	@comprobante_nro int
AS
BEGIN
	UPDATE COMPROBANTES SET id_forma_pago = @idFormaPago, id_forma_compra = @idFormaCompra, id_descuento = @idDescuento,
		   id_estado = @idEstado, descripcion = @descripcion
	WHERE id_comprobante = @comprobante_nro;
	
	DELETE DETALLE_COMPROBANTES
	WHERE id_comprobante = @comprobante_nro;
END


GO

--------------------------------------SP PARA TABLA SOPORTE-------------------------------------------

--CONSULTAR PELICULAS
CREATE PROC SP_CONSULTAR_PELICULAS
AS
BEGIN
	SELECT * from PELICULAS;
END

GO


--INSERTAR PELICULAS
CREATE PROC SP_INSERTAR_PELICULA
	@idClasificacion INT,
	@idIdioma INT,
	@idDirector INT,
	@nombrePelicula VARCHAR (100),
	@fechaEstreno DATETIME
	--@pelicula_nro INT OUTPUT
AS
BEGIN
	INSERT INTO PELICULAS(id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno)
    VALUES (@idClasificacion, @idIdioma, @idDirector, @nombrePelicula, @fechaEstreno)
    --Asignamos el valor del último ID autogenerado (obtenido --  
    --mediante la función SCOPE_IDENTITY() de SQLServer)	
    --SET @pelicula_nro = SCOPE_IDENTITY();
END

GO

--MODIFICAR PELICULA
CREATE PROC SP_MODIFICAR_PELICULA
	@idClasificacion INT,
	@idIdioma INT,
	@idDirector INT,
	@nombrePelicula VARCHAR (100),
	@fechaEstreno DATETIME,
	@peliculaNro INT
AS
BEGIN
	UPDATE PELICULAS SET id_clasificacion = @idClasificacion, id_idioma = @idIdioma, id_director = @idDirector,
		   nombre_pelicula = @nombrePelicula, fecha_estreno = @fechaEstreno 
	WHERE id_pelicula = @peliculaNro;
	
END


GO
--BORRAR PELICULA
CREATE PROC BORRAR_PELICULA
	@pelicula_nro int
AS
BEGIN
	DELETE 
	FROM PELICULAS
	WHERE id_pelicula = @pelicula_nro
END


	select * from PELICULAS

INSERT INTO PELICULAS(id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno)
    VALUES (1, 1, 1, 'PRUEBA1', '07/07/1985');


GO
--CONSULTAR DIRECTORES
CREATE PROC SP_CONSULTAR_DIRECTORES
AS
BEGIN
SELECT id_director,nombre FROM DIRECTORES
END


GO

--CONSULTAR IDIOMAS
CREATE PROC SP_CONSULTAR_IDIOMAS
AS
BEGIN
SELECT id_idioma, idioma + ' | ' + subtitulos as idioma FROM IDIOMAS
END


GO
--CONSULTAR CLASIFICACION
CREATE PROC SP_CONSULTAR_CLASIFICACIONES
AS
BEGIN
SELECT id_clasificacion, clasificacion from CLASIFICACIONES
end











