-- Hacer un procedimiento almacenado que permita inscribir un socio a una
-- actividad. Se debe recibir el Legajo, el código de actividad y el estado
-- de beca. El procedimiento debe asegurar que un socio no pueda estar becado
-- en más de dos actividades a la vez. En caso de que esto ocurra, listar un
-- mensaje de error y no registrar la inscripción. De lo contrario, inscribir al socio


-- Crear un Trigger que al eliminar un socio, 
-- elimine toda la información de inscripciones
-- y pagos realizados.
Create Trigger TR_BorrarSocio ON Socios
Instead of Delete
As
Begin	
	Declare @Legajo bigint
	Select @Legajo = Legajo From Deleted

	Delete from Pagos Where Legajo = @Legajo
	Delete From Inscripciones Where Legajo = @Legajo
	Delete From Socios Where Legajo = @Legajo
End

Select * From Socios
Select * From PAgos Where Legajo = 8000

Delete From Socios Where Legajo = 8000

-- Crear un Trigger que al agregar un pago, establezca el importe 
-- del mismo a partir
-- del costo de las actividades que el socio realiza.
Create Trigger TR_NuevoPago ON Pagos
After Insert
as
Begin
	Declare @Legajo bigint
	Declare @IDPago bigint
	Declare @Importe money
	
	Select @Legajo = Legajo, @IDPago = IDPago
	From Inserted
	
	Select @Importe = ISNULL(SUM(A.Costo), 0)
	From Actividades as A
	Inner Join Inscripciones as I
	ON I.IDActividad = A.ID
	Where Legajo = @Legajo And
	I.Becado = 0
	
	if @Importe = 0 BEGIN
		Rollback transaction
	END
	else begin
	Update Pagos Set Importe = @Importe
	Where IDPago = @IDPago	
	end
End

Select * From Socios

Insert into Socios(Legajo, Apellidos, Nombres, FechaNacimiento, Genero)
Values (8000, 'Simon', 'Angel', '02/10/1986', 'M')

Select top 1 * From Pagos
order by IDPAgo Desc

-- No se inserta porque el socio no tiene actividades por lo tanto su cuota es de $0.
Insert into Pagos(Legajo, Mes, Anio, Fecha, Estado, Importe)
Values (8000, 1, 2020, getdate(), 1, 100000)

Select top 1 * From Pagos
order by IDPAgo Desc