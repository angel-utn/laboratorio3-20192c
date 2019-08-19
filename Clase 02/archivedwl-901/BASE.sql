CREATE Database MiniUTN
go
USE MiniUTN
go
Create Table Alumnos(
 Legajo int primary key identity(1, 1),
 Apellidos varchar(50) not null,
 Nombres varchar(50) not null
)
go
Create Table Carreras(
 ID int identity (1, 1),
 Nombre varchar(100) not null,
 NombreCorto varchar(10) not null,
 Duracion tinyint not null,
 primary key (ID)
)
go
Create Table Materias(
 ID int identity(1,1),
 Nombre varchar(100) not null,
 IDCarrera int not null foreign key references Carreras(ID),
 Anio tinyint not null,
 Cuatrimestre tinyint not null
)
go
Alter Table Materias
Add Constraint PK_Materias Primary Key (ID)
go
Create Table Examenes(
 Legajo int not null,
 IDMateria int not null,
 Fecha date not null,
 Nota tinyint null
 primary key (Legajo, IDMateria, Fecha)
)
--Alter Table Examanes
--Add Constraint PK_Examenes Primary key (Legajo, IDMateria, Fecha)
go
Alter Table Examenes
Add Constraint FK_Legajo Foreign Key(Legajo)
References Alumnos(Legajo)
go
Alter Table Examenes
Add Constraint FK_Materias Foreign key (IDMateria)
References Materias(ID)
go
Alter Table Examenes
Add Constraint CHK_Nota Check (Nota >=1 AND Nota <=10)
GO
Create Table Inscripciones(
  IDInscripcion	bigint not null primary key,
  Legajo	int not null foreign key references Alumnos(Legajo),
  IDMateria	int not null foreign key references Materias (ID),
  Año	tinyint not null,
  Cuatrimestre	tinyint not null,
  Estado	char not null,
  Fecha	datetime not null
)
go
Alter Table Inscripciones
Add Constraint UQ_Inscripcion Unique(Legajo, IDMateria, Año, Cuatrimestre)
GO
Create Table Bajas(
  Legajo int not null foreign key references Alumnos(Legajo),
  IDCarrera int not null foreign key references Carreras(ID),
  Fecha date not null,
  Motivo varchar(2048) null,
  primary key (Legajo, IDCarrera)
)

