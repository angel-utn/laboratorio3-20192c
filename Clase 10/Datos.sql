Create Database LAB3_20192C_Parcial1_Parte2
go
Use LAB3_20192C_Parcial1_Parte2
go
Create Table Libros(
	ID bigint not null primary key,
	Nombre varchar(100) not null,
	Anio int not null,
	Paginas int not null
)
go
Create Table Usuarios(
	ID bigint not null primary key,
	Apellidos varchar(50) not null,
	Nombres varchar(50) not null
)
go
Create Table Lecturas(
	ID bigint not null primary key identity (1, 1),
	IDLibro bigint not null foreign key references Libros(ID),
	IDUsuario bigint not null foreign key references Usuarios(ID),
	FechaInicio date not null,
	FechaFin date not null,
	Puntaje tinyint null
)
go
Set dateformat 'dmy'
go
Insert into Libros (ID, Nombre, Anio, Paginas) VALUES (1, 'IT', 1986, 1500)
Insert into Libros (ID, Nombre, Anio, Paginas) VALUES (2, 'El viejo y el mar', 1952, 156)
Insert into Libros (ID, Nombre, Anio, Paginas) VALUES (3, 'Ready player one', 2011, 385)
Insert into Libros (ID, Nombre, Anio, Paginas) VALUES (4, 'La danza de la muerte', 1978, 1536)
Insert into Libros (ID, Nombre, Anio, Paginas) VALUES (5, 'Mujercitas', 1868, 759)
Insert into Libros (ID, Nombre, Anio, Paginas) VALUES (6, 'Angel Sim�n: La biograf�a', 2019, 8500)

Insert into Usuarios (ID, Apellidos, Nombres) VALUES (1, 'Seinfeld', 'Jerry')
Insert into Usuarios (ID, Apellidos, Nombres) VALUES (2, 'Costanza', 'George')
Insert into Usuarios (ID, Apellidos, Nombres) VALUES (3, 'Benes', 'Elaine')
Insert into Usuarios (ID, Apellidos, Nombres) VALUES (4, 'Kramer', 'Cosmo')

Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (1, 1, '1/1/2017', '10/1/2017', 10)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (1, 2, '1/1/2018', '3/3/2018', 6)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (1, 2, '5/5/2018', '3/2/2019', 6)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (1, 3, '1/1/2019', '5/5/2019', 6)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (1, 4, '1/1/2016', '7/7/2018', 8)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (1, 1, '1/1/2019', '10/1/2019', 10)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (1, 2, '1/1/2019', '27/2/2019', 6)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (2, 1, '1/1/2010', '8/8/2010', 10)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (2, 2, '1/1/2015', '4/1/2015', 10)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (2, 3, '1/1/2013', '9/9/2013', 10)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (3, 1, '1/1/2014', '7/7/2014', NULL)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (3, 2, '1/1/2013', '6/6/2013', NULL)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (3, 3, '1/1/2016', '8/8/2017', NULL)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (4, 1, '1/1/2017', '9/9/2019', 3)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (4, 2, '1/1/2000', '31/12/2000', 2)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (4, 4, '1/1/2012', '1/1/2013', 3)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (5, 1, '1/1/2013', '5/5/2013', 9)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (5, 2, '1/1/2015', '6/6/2015', 8)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (5, 3, '1/1/2019', '9/9/2019', 9)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (6, 1, '1/1/2019', '1/10/2019', 10)
Insert into Lecturas(IDLibro, IDUsuario, FechaInicio, FechaFin, Puntaje) VALUES (6, 2, '1/1/2019', '1/10/2019', 10)

