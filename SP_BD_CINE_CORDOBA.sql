--SP CONSULTAR ENTRADAS
CREATE PROC SP_CONSULTAR_ENTRADAS
AS
BEGIN
	
	SELECT * from ENTRADAS;
END


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





select * from COMPROBANTES

select * from DETALLE_COMPROBANTES



--------------------------------------SP PARA TABLA SOPORTE-------------------------------------------

--CONSULTAR PELICULAS
CREATE PROC SP_CONSULTAR_PELICULAS
AS
BEGIN
	SELECT * from PELICULAS;
END


--INSERTAR PELICULAS
CREATE PROC SP_INSERTAR_PELICULA
	@idClasificacion INT,
	@idIdioma INT,
	@idDirector INT,
	@nombrePelicula VARCHAR (100),
	@fechaEstreno DATETIME,
	@pelicula_nro INT OUTPUT
AS
BEGIN
	INSERT INTO PELICULAS(id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno)
    VALUES (@idClasificacion, @idIdioma, @idDirector, @nombrePelicula, @fechaEstreno);
    --Asignamos el valor del último ID autogenerado (obtenido --  
    --mediante la función SCOPE_IDENTITY() de SQLServer)	
    SET @pelicula_nro = SCOPE_IDENTITY();
END


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