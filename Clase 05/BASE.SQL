--Use master
--go
--Drop Database Club
--Go
Create Database Club
GO
Use Club
GO
--TP 1
Create Table Socios(
  Legajo int not null primary key,
  Apellidos varchar(50) not null,
  Nombres varchar(50) not null,
  FechaNacimiento date not null,
  Genero char null
)
GO
Create Table Provincias(
  ID int not null primary key identity (1, 1),
  Nombre varchar(50) not null
)
GO
Create Table Localidades(
  ID int not null primary key,
  IDProvincia int not null foreign key references Provincias(ID),
  Nombre varchar(50) not null
)
GO
Create Table Sedes(
  ID int not null primary key identity (1, 1),
  Nombre varchar(50) not null,
  Direccion varchar(100) not null,
  IDLocalidad int not null foreign key references Localidades(ID),
  Telefono varchar(15) null,
  Mail varchar(100) null
)
GO
Create Table Actividades(
  ID int not null primary key identity (1, 1),
  Nombre varchar(50) not null,
  Costo money not null,
  AptoMedico bit not null,
  IDSede int not null foreign key references Sedes(ID)
)
GO
-- TP2
Create Table Inscripciones(
  IDInscripcion bigint not null primary key identity (1, 1),
  Legajo int not null foreign key references Socios(Legajo),
  IDActividad int not null foreign key references Actividades(ID),
  Becado bit not null,
  FechaInscripcion date not null
)
GO
Create Table Pagos(
  IDPago bigint not null primary key identity (1, 1),
  Legajo int not null foreign key references Socios(Legajo),
  Mes tinyint not null,
  Anio smallint not null,
  Fecha date not null,
  Estado char not null,
  Importe money not null,
  Unique(Legajo, Mes, Anio)
)
GO
Create Table Horarios(
  IDHorario bigint not null primary key identity (1, 1),
  IDActividad int not null foreign key references Actividades(ID),
  Dia tinyint not null,
  Inicio time not null,
  Fin time not null
)
-- Restricciones Check
Alter Table Socios Add Constraint Chk_FechaNacimiento Check (FechaNacimiento <= '1/1/2010')
GO
Alter Table Actividades Add Constraint Chk_Costo Check (Costo > 0)
GO
Alter Table Pagos add constraint Chk_Estado Check (Estado in ('1', '2', '3'))
GO
Alter Table Pagos add constraint Chk_Importe Check (Importe >= 0)
GO
Alter Table Horarios add constraint Chk_Dia Check (Dia between 1 and 7)
GO
Alter Table Horarios add constraint Chk_Tiempo Check (Fin > Inicio)