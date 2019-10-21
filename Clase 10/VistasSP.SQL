-- Vistas

-- 1) Hacer una vista que permita ver para cada socio los nombres de las actividades
-- y sedes donde las realiza.
Create View VW_Punto1
AS
Select S.Apellidos, S.Nombres, A.Nombre as Actividad, SE.Nombre as Sede
From Socios as S
Inner Join Inscripciones as I ON I.Legajo = S.Legajo
Inner Join Actividades as A ON A.ID = I.IDActividad
Inner Join Sedes as SE ON SE.ID = A.IDSede

-- 2) Hacer una vista que permita ver para cada actividad, el nombre y
-- la cantidad de socios inscriptos que posee.
Create View VW_Punto2
AS
Select A.Nombre, COUNT(I.IDInscripcion) as Cantidad
From Actividades as A
Left Join Inscripciones as I ON I.IDActividad = A.ID
Group By A.Nombre

-- 3) Hacer una vista que permita ver para cada socio, el apellido, nombres y la
-- cantidad de actividades en la que se encuentre becado.
Create View VW_Punto3
As
Select S.Apellidos, S.Nombres, COUNT(I.IDInscripcion) as Becado
From Socios as S
Inner Join Inscripciones as I ON I.Legajo = S.Legajo
Where I.Becado = 1
Group By S.Apellidos, S.Nombres

-- 4) Hacer una vista que permita ver para cada socio, el apellido y nombre,
-- el mes y año del pago y el importe del pago
Create View VW_Punto4
AS
Select S.Apellidos, S.Nombres, P.Mes, P.Anio, P.Importe
From Socios as S
Inner Join Pagos as P ON P.Legajo = S.Legajo

-- 5) Hacer una vista que permita ver para cada socio el apellido y nombre,
-- el género, la cantidad de pagos realizados y el importe total en concepto de
-- pagos.
Create View VW_Punto4
AS
Select S.Apellidos, S.Nombres, S.Genero, COUNT(P.IDPago) as Cantidad, SUM(P.Importe) as Total
From Socios as S
Inner Join Pagos as P ON P.Legajo = S.Legajo
Group By S.Apellidos, S.Nombres, S.Genero

--- Procedimientos almacenados

-- 1) Hacer un procedimiento almacenado que permita listar la información de
-- todas las actividades
Create Procedure SP_Punto1
As
Begin
	Select * From Actividades
End

-- 2) Hacer un procedimiento almacenado que permita listar la información de
-- todas las actividades a partir del Apto médico. El procedimiento recibirá
-- un 1 para listar las actividades que requieren apto médico o un 0
-- para las que no requieren apto médico.
Create Procedure SP_Punto2(
	@AptoMedico bit
)
as
Begin
	Select * From Actividades Where AptoMedico = @AptoMedico
End

-- 3) Hacer un procedimiento almacenado que reciba un legajo de socio y
-- liste todas las actividades que realiza ese socio.
Create Procedure SP_Punto3(
	@Legajo int
)
As
Begin
	Select A.Nombre From Actividades as A
	Inner Join Inscripciones as I
	ON A.ID = I.IDActividad
	Where I.Legajo = @Legajo
End
-- 4) Hacer un procedimiento almacenado que reciba un legajo de socio y un
-- número de año y liste todos los pagos realizados por ese socio en ese año.
Create Procedure SP_Punto4(
	@Legajo int,
	@Anio smallint
)
as
Begin
	Select * From Pagos Where Legajo = @Legajo And Anio = @Anio
End

-- 5) Hacer un procedimiento almacenado que reciba un legajo de socio y un
-- número de año y liste el total abonado por ese socio a lo largo del año.
Create Procedure SP_Punto4(
	@Legajo int,
	@Anio smallint
)
as
Begin
	Select SUM(Importe) As Total From Pagos Where Legajo = @Legajo And Anio = @Anio
End


-- 6) Hacer un procedimiento almacenado que reciba un legajo de socio y un
-- código de actividad y beque a dicho socio en esa actividad. El procedimiento
-- debe contemplar dos situaciones:
-- A) El socio ya se encuentre inscripto a la actividad, por lo tanto, se modifica
-- su estado de Becado.
-- B) El socio no se encuentra inscripto a la actividad, por lo tanto, se lo
-- inscribe becado a la actividad.
Create Procedure SP_Punto6(
	@Legajo int,
	@IDActividad int
)
AS
BEGIN
	Declare @Inscripto smallint
	-- Verificar que el socio este inscripto
	Select @Inscripto = COUNT(*) From Inscripciones Where Legajo = @Legajo
	And IDActividad = @IDActividad
	
	-- Ya se encuentra inscripto
	IF @Inscripto = 1 BEGIN
		UPDATE Inscripciones SET Becado = 1 Where Legajo = @Legajo
		And IDActividad = @IDActividad
	END
	ELSE BEGIN
		Insert INto Inscripciones(Legajo, IDActividad, FechaInscripcion, Becado)
		Values (@Legajo, @IDActividad, GETDATE(), 1)
	END
END

-- 7) Hacer un procedimiento almacenado que permita inscribir un socio a una
-- actividad. Se debe recibir el Legajo, el código de actividad y el estado
-- de beca. El procedimiento debe asegurar que un socio no pueda estar becado
-- en más de dos actividades a la vez. En caso de que esto ocurra, listar un
-- mensaje de error y no registrar la inscripción. De lo contrario, inscribir al socio
Create Procedure SP_Punto7(
	@Legajo int,
	@IDActividad int
)
As
Begin
	Declare @CantBecas int
	Select @CantBecas = COUNT(*) From Inscripciones
	Where Becado = 1 AND Legajo = @Legajo
	
	IF @CantBecas >= 2 BEGIN
		RAISERROR('No se puede becar', 16, 1)
	END
	ELSE BEGIN
		Insert INto Inscripciones(Legajo, IDActividad, FechaInscripcion, Becado)
		Values (@Legajo, @IDActividad, GETDATE(), 1)
	END
End

-- 8) Hacer un procedimiento almacenado que permita registrar un pago de un socio.
-- El procedimiento debe recibir el Legajo, mes y año y calcular el importe del
-- pago. Para ello deberá sumar el costo de todas las actividades que realice el
-- socio en las que no se encuentre becado. Tener en cuenta que el importe puede
-- ser cero.

Select * From Actividades

Create Procedure SP_Punto8(
	@Legajo int,
	@Mes smallint,
	@Anio smallint
)
AS
BEGIN
	Declare @Importe money
	-- Obtenemos el importe de todas las actividades que el socio hace y no esté becado
	Select @Importe = ISNULL(SUM(A.Costo), 0) From
	Actividades as A
	Inner Join Inscripciones as I ON A.ID = I.IDActividad
	Where I.Legajo = @Legajo AND I.Becado = 0
	
	Insert into Pagos(Legajo, Mes, Anio, Importe, Fecha, Estado)
	VALUES (@Legajo, @Mes, @Anio, @Importe, GETDATE(), 1)
END
-- 9) Hacer un procedimiento almacenado que permita eliminar un socio. Para ello
-- debe realizar, además, la eliminación de: 
-- Todos los pagos e inscripciones del socio.
Create Procedure SP_Punto9(
	@Legajo int
)
As
Begin
	-- Eliminamos los pagos e inscripciones del socio primero
	Begin Try
		Begin Transaction
			Delete From Inscripciones Where Legajo = @Legajo
			Delete From Pagos Where Legajo = @Legajo
			Delete From Socios Where Legajo = @Legajo
			
			if @@ROWCOUNT > 0 begin
				Print 'Registros eliminados'
			end
			else begin
				Print 'No existe el socio'
			end
			
		Commit Transaction
	End Try
	Begin Catch
		RollBack Transaction
		Raiserror('Error al eliminar', 16, 1)
	End Catch
End
-- 10) Hacer un procedimiento almacenado que reciba un valor Decimal(5, 2) y
-- permita aumentar porcentualmente el costo de todas las actividades 
-- a partir de dicho valor. Generar una excepción si el valor 
-- recibido no es positivo. 
Create Procedure SP_Punto10(
	@Valor decimal(5, 2)
)
As
Begin
	IF @Valor <= 0 begin
		Raiserror('Valor de aumento incorrecto', 16, 1)
	end
	Else Begin
		UPDATE Actividades SET Costo = Costo + (Costo * @Valor / 100)
	End
End