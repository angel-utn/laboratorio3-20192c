Create Database Parcial1_20192C
go
Use Parcial1_20192C
go
Create Table Libros(
  ID bigint not null primary key,
  Nombre varchar(100) not null,
  Año int not null,
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
  ID bigint not null primary key identity (1,1),
  IDLibro bigint not null foreign key references Libros(ID),
  IDUsuario bigint not null foreign key references Usuarios(ID),
  FechaInicio date not null,
  FechaFin date null,
  Puntaje tinyint null
)
