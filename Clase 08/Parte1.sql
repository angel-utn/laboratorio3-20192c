-- PARTE 1
Create Database Pizzeria
go
Use Pizzeria
Go
Create Table Pizzas(
 ID bigint not null primary key identity (1, 1),
 Nombre varchar(100) not null,
 Precio money not null check (Precio >= 0)
)
go
Create Table Tipos_Ingredientes(
 ID bigint not null primary key identity (1, 1),
 Nombre varchar(50) not null
)
go
Create Table Ingredientes(
 ID bigint not null primary key identity (1, 1),
 Nombre varchar(100) not null,
 IDTipo bigint not null foreign key references Tipos_Ingredientes(ID)
)
go
Create Table Recetas(
 IDPizza bigint not null foreign key references Pizzas(ID),
 IDIngrediente bigint not null foreign key references Ingredientes (ID), 
 Cantidad decimal(6,2) not null check (Cantidad > 0),
 Primary key (IDPizza, IDIngrediente)
)