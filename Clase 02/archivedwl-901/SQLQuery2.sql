Use MiniUTN
go
-- Ejemplo de Inserción de Datos
Insert Into Alumnos(Apellidos, Nombres)
Values ('Seinfeld', 'Jerry')
go
Insert Into Alumnos(Apellidos, Nombres)
Values ('Benes', 'Elaine')
go
Insert Into Alumnos(Apellidos, Nombres)
Values ('Costanza', 'George'),
	   ('Newman', 'Jorge')

-- Ejemplo de Modificación de Datos
Update Alumnos Set Apellidos ='Kramer', Nombres='Cosmo' WHERE Legajo = 4

-- Ejemplo de Eliminación de Datos
Delete from Alumnos Where Legajo = 3