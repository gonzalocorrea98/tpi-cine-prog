CREATE DATABASE CINE_CORDOBA_PROG
GO
USE [CINE_CORDOBA_PROG]
GO

SET DATEFORMAT dmy

/****** Object:  Table [dbo].[CLASIFICACIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLASIFICACIONES](
	[id_clasificacion] [int] IDENTITY(1,1) NOT NULL,
	[clasificacion] [varchar](10) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [pk_clasificaciones] PRIMARY KEY CLUSTERED 
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[apellido_cliente] [varchar](50) NOT NULL,
	[genero] [varchar](20) NULL,
	[fecha_alta] [datetime] NOT NULL,
	[fecha_nacimiento] [datetime] NULL,
 CONSTRAINT [pk_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPROBANTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPROBANTES](
	[id_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_forma_pago] [int] NOT NULL,
	[id_forma_compra] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_estado] [int] NOT NULL,
	[total] [float] NULL,
 CONSTRAINT [pk_comprobantes] PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLES_COMPROBANTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLES_COMPROBANTES](
	[id_detalle_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[id_comprobante] [int] NOT NULL,
	[id_funcion] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [pk_detalles] PRIMARY KEY CLUSTERED 
(
	[id_detalle_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRECTORES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRECTORES](
	[id_director] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fecha_nacimiento] [datetime] NULL,
 CONSTRAINT [pk_directores] PRIMARY KEY CLUSTERED 
(
	[id_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADOS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADOS](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](25) NOT NULL,
 CONSTRAINT [pk_id_estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMAS_COMPRAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMAS_COMPRAS](
	[id_forma_compra] [int] IDENTITY(1,1) NOT NULL,
	[forma_compra] [varchar](25) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [pk_formas_compras] PRIMARY KEY CLUSTERED 
(
	[id_forma_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMAS_PAGOS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMAS_PAGOS](
	[id_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[forma_pago] [varchar](25) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [pk_formas_pagos] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FUNCIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUNCIONES](
	[id_funcion] [int] IDENTITY(1,1) NOT NULL,
	[id_horario_funcion] [int] NOT NULL,
	[id_pelicula] [int] NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [pk_funciones] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORARIOS_FUNCIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORARIOS_FUNCIONES](
	[id_horario_funcion] [int] IDENTITY(1,1) NOT NULL,
	[horario] [time](7) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_horarios_funcoiones] PRIMARY KEY CLUSTERED 
(
	[id_horario_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IDIOMAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDIOMAS](
	[id_idioma] [int] IDENTITY(1,1) NOT NULL,
	[idioma] [varchar](20) NOT NULL,
	[subtitulos] [varchar](20) NOT NULL,
 CONSTRAINT [pk_idiomas] PRIMARY KEY CLUSTERED 
(
	[id_idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PELICULAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PELICULAS](
	[id_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[id_clasificacion] [int] NOT NULL,
	[id_idioma] [int] NOT NULL,
	[id_director] [int] NULL,
	[nombre_pelicula] [varchar](50) NOT NULL,
	[fecha_estreno] [datetime] NOT NULL,
 CONSTRAINT [pk_peliculas] PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Position] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_comprobantes_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[CLIENTES] ([id_cliente])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_comprobantes_clientes]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_comprobantes_estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[ESTADOS] ([id_estado])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_comprobantes_estados]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_comprobantes_formas_compras] FOREIGN KEY([id_forma_compra])
REFERENCES [dbo].[FORMAS_COMPRAS] ([id_forma_compra])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_comprobantes_formas_compras]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_comprobantes_formas_pagos] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[FORMAS_PAGOS] ([id_forma_pago])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_comprobantes_formas_pagos]
GO
ALTER TABLE [dbo].[DETALLES_COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_detalles_comprobantes] FOREIGN KEY([id_comprobante])
REFERENCES [dbo].[COMPROBANTES] ([id_comprobante])
GO
ALTER TABLE [dbo].[DETALLES_COMPROBANTES] CHECK CONSTRAINT [fk_detalles_comprobantes]
GO
ALTER TABLE [dbo].[DETALLES_COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_detalles_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[FUNCIONES] ([id_funcion])
GO
ALTER TABLE [dbo].[DETALLES_COMPROBANTES] CHECK CONSTRAINT [fk_detalles_funciones]
GO
ALTER TABLE [dbo].[FUNCIONES]  WITH CHECK ADD  CONSTRAINT [fk_funciones_horarios_funciones] FOREIGN KEY([id_horario_funcion])
REFERENCES [dbo].[HORARIOS_FUNCIONES] ([id_horario_funcion])
GO
ALTER TABLE [dbo].[FUNCIONES] CHECK CONSTRAINT [fk_funciones_horarios_funciones]
GO
ALTER TABLE [dbo].[FUNCIONES]  WITH CHECK ADD  CONSTRAINT [fk_funciones_peliculas] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[PELICULAS] ([id_pelicula])
GO
ALTER TABLE [dbo].[FUNCIONES] CHECK CONSTRAINT [fk_funciones_peliculas]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_clasificaciones] FOREIGN KEY([id_clasificacion])
REFERENCES [dbo].[CLASIFICACIONES] ([id_clasificacion])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_peliculas_clasificaciones]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_directores] FOREIGN KEY([id_director])
REFERENCES [dbo].[DIRECTORES] ([id_director])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_peliculas_directores]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_idiomas] FOREIGN KEY([id_idioma])
REFERENCES [dbo].[IDIOMAS] ([id_idioma])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_peliculas_idiomas]
GO
/****** Object:  StoredProcedure [dbo].[BORRAR_PELICULA]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--BORRAR PELICULA
CREATE PROC [dbo].[BORRAR_PELICULA]
	@pelicula_nro int
AS
BEGIN
	DELETE 
	FROM PELICULAS
	WHERE id_pelicula = @pelicula_nro
END


GO
/****** Object:  StoredProcedure [dbo].[SP_BORRAR_COMPROBANTE]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BORRAR_COMPROBANTE]
	@comprobante_nro int
AS
BEGIN
	UPDATE COMPROBANTES
	SET id_estado = 6
	WHERE id_comprobante = @comprobante_nro
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLASIFICACIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR CLASIFICACION
CREATE PROC [dbo].[SP_CONSULTAR_CLASIFICACIONES]
AS
BEGIN
SELECT id_clasificacion, clasificacion from CLASIFICACIONES
end








--SP CONSULTAR COMPROBANTES
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_CLIENTES]
AS
BEGIN
	SELECT id_cliente, apellido_cliente + ', ' + nombre_cliente AS nombre
	FROM CLIENTES
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_COMPROBANTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_COMPROBANTES]
AS
BEGIN
	SELECT id_comprobante, c.apellido_cliente + ', ' + c.nombre_cliente as cliente, fp.forma_pago as forma_pago, fc.forma_compra as forma_compra, co.total as total, co.fecha as fecha
	FROM COMPROBANTES co join CLIENTES c on co.id_cliente = c.id_cliente
						 join FORMAS_COMPRAS fc on co.id_forma_compra = fc.id_forma_compra
						 join FORMAS_PAGOS fp on co.id_forma_pago = fp.id_forma_pago
	where id_estado = 5
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_DIRECTORES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR DIRECTORES
CREATE PROC [dbo].[SP_CONSULTAR_DIRECTORES]
AS
BEGIN
SELECT id_director,nombre FROM DIRECTORES
END


GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FORMA_COMPRA]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_FORMA_COMPRA]
AS
BEGIN
	SELECT id_forma_compra, forma_compra + ' (' + descripcion + ')' as descripcion
	FROM FORMAS_COMPRAS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FORMA_PAGO]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_FORMA_PAGO]
AS
BEGIN
	SELECT id_forma_pago, forma_pago + ' (' + descripcion + ')' as descripcion
	FROM FORMAS_PAGOS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FUNCIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_FUNCIONES]
AS
BEGIN
	SELECT id_funcion, precio, p.nombre_pelicula + ' | ' + CONVERT(varchar, h.horario , 108) AS descripcion
	FROM FUNCIONES f join PELICULAS p on f.id_pelicula = p.id_pelicula
					 join HORARIOS_FUNCIONES h on f.id_horario_funcion = h.id_horario_funcion 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_IDIOMAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CONSULTAR IDIOMAS
CREATE PROC [dbo].[SP_CONSULTAR_IDIOMAS]
AS
BEGIN
SELECT id_idioma, idioma + ' | ' + subtitulos as idioma FROM IDIOMAS
END


GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PELICULAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR PELICULAS
CREATE PROC [dbo].[SP_CONSULTAR_PELICULAS]
AS
BEGIN
	SELECT * from PELICULAS;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_INSERTAR_DETALLE
CREATE PROC [dbo].[SP_INSERTAR_DETALLE] 
	@idComprobante int,
	@idFuncion int, 
	@cantidad int
AS
BEGIN
	INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad)
	VALUES (@idComprobante, @idFuncion, @cantidad); 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_MAESTRO]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR MAESTRO
CREATE PROC [dbo].[SP_INSERTAR_MAESTRO]
	@idCliente INT,
	@idFormaPago INT,
	@idFormaCompra INT,
	@total FLOAT,
	@comprobante_nro INT OUTPUT
AS
BEGIN
	INSERT INTO COMPROBANTES(id_cliente, id_forma_pago, id_forma_compra, fecha, id_estado, total)
    VALUES (@idCliente, @idFormaPago, @idFormaCompra, GETDATE(), 5, @total);
    --Asignamos el valor del último ID autogenerado (obtenido --  
    --mediante la función SCOPE_IDENTITY() de SQLServer)	
    SET @comprobante_nro = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_PELICULA]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--INSERTAR PELICULAS
CREATE PROC [dbo].[SP_INSERTAR_PELICULA]
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
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_MAESTRO]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--MODIFICAR MAESTRO
CREATE PROC [dbo].[SP_MODIFICAR_MAESTRO]
	@comprobante_nro INT,
	@idCliente INT,
	@idformaPago INT,
	@idFormaCompra INT,
	@total float
AS
BEGIN
	UPDATE COMPROBANTES SET id_cliente = @idCliente, id_forma_pago = @idFormaPago, id_forma_compra = @idFormaCompra, total = @total				
	WHERE id_comprobante = @comprobante_nro;
	DELETE DETALLES_COMPROBANTES
	WHERE id_comprobante = @comprobante_nro;
END


GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_PELICULA]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--MODIFICAR PELICULA
CREATE PROC [dbo].[SP_MODIFICAR_PELICULA]
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
USE [master]
GO
ALTER DATABASE [CINE_CORDOBA_PROG] SET  READ_WRITE 
GO


------------------------------------INSERTS--------------------------------------------


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


----------- insert ESTADOS --------
INSERT INTO ESTADOS(estado) VALUES ('Habilitado')
INSERT INTO ESTADOS(estado) VALUES ('Desabilitado')
INSERT INTO ESTADOS(estado) VALUES ('Pendiente')
INSERT INTO ESTADOS(estado) VALUES ('Concretado')
INSERT INTO ESTADOS(estado) VALUES ('Alta')
INSERT INTO ESTADOS(estado) VALUES ('Baja')


----- insert FORMAS_COMPRAS --------
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Pagina Web','No Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Boleteria','Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Auto-Boleteria','Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('App','No Presencial')


----- insert FORMAS_PAGOS --------
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Efectivo','Solo en Boleterias')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Tarjeta Debito','Visa, American Express, Mastercard')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Tarjeta Credito','Visa, American Express, Mastercard')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Transferencia Bancaria','')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Mercado Pago','')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('MODO','')


----- insert COMPROBANTES --------
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado, total) VALUES (1, 1, 1, '16/11/2022', 5, 0)    
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado, total) VALUES (1, 2, 2, '16/11/2022', 5, 0)


---- Insert Clasificaciones -------
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('G', 'Apta para todo público')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('PG', 'Guía paternal sugerida')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('PG-13', 'guía paternal estricta para menores de 13 años')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('R', 'Menores de 17 años requiere compañia de padre o tutor adulto')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('NC', 'Nadie de 17 años o menos es admitido')


---- Insert IDIOMAS -------
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Castellano','Sin Subtitulos')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Castellano','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Inglés','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Ingles','Sub-Ingles')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Ingles','Sin Subtitulos')
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
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('14:00:00', 'Visita escolar')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('18:00:00', '')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('19:00:00', '')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('20:00:00', '')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('20:30:00', 'Especial San Valentin')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('21:00:00', '')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('23:00:00', 'Especial Hallowen')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('00:15:00', 'Trasnoche')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('00:30:00', 'Trasnoche')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('01:00:00', 'Trasnoche')


---- Insert FUNCIONES -------
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (3,1,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (4,1,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (5,1,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (6,11,1000)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (8,1,1000)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (3,3,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (4,3,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (3,2,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (4,2,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (5,2,400)


---- Insert DETALLLE_COMPROBANTES -------
INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (1, 1, 1)
INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (2, 2, 2)