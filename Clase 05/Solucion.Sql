--La cantidad de socios.
Select Count(*) as CantidadSocios From Socios

--La cantidad de socios que se identifican con el sexo femenino (XLS).
Select Count(*) as CantidadSocios From Socios Where Genero = 'F'

--La cantidad de socios que nacieron en el año 1990.
Select Count(*) as CantidadSocios From Socios Where Year(FechaNacimiento) = 1990

--El promedio de los importes de todos los pagos.
Select Avg(Importe) as Promedio From Pagos

--El promedio de los importes de todos los pagos realizados este año (XLS).
Select Avg(Importe) as Promedio From Pagos Where Year(Fecha) = Year(getdate())

--La sumatoria de importes de todos los pagos.
Select Sum(Importe) as Total From Pagos

--La sumatoria de importes de todos los pagos con estado 2 y 3 (XLS).
Select Sum(Importe) as Total From Pagos Where Estado in (2, 3)

--El importe máximo entre todos los pagos (XLS).
Select Max(Importe) As Maximo From pagos

--La cantidad de actividades que requieran apto médico en la sede 2.
Select Count(*) as Cantidad from Actividades Where AptoMedico = 1 and IDSede = 2

--El costo promedio de las actividades que no requieren apto médico.
Select Avg(Costo) as CostoPromedio From Actividades Where AptoMedico = 0

--El costo mínimo entre todas las actividades (XLS).
Select Min(Costo) as Minimo From Actividades

--La cantidad de actividades por sede. Listar el nombre de la sede y la cantidad de actividades realizadas allí. (XLS)
Select S.Nombre, Count(*) As Cantidad From Sedes as S
Inner Join Actividades as A ON A.IDSede = S.ID
Group By S.Nombre

--La sumatoria de importes pagados por cada socio. Listar el apellido y nombres de todos los socios y el total abonado. (XLS)
Select S.Apellidos, S.Nombres, Sum(P.Importe) As SumaPagos From Socios as S
Inner Join Pagos as P ON P.Legajo = S.Legajo
Group By S.Apellidos, S.Nombres

--El importe abonado por cada socio en cada año. Listar el apellido y nombres de todos los socios y el total abonado por cada año.
Select S.Apellidos, S.Nombres, Year(P.Fecha) as Año, Sum(P.Importe) As SumaPagos From Socios as S
Inner Join Pagos as P ON P.Legajo = S.Legajo
Group By S.Apellidos, S.Nombres, Year(P.Fecha)

--La cantidad de actividades realizadas por socio. Listar el apellido y nombres de todos los socios y la cantidad de actividades en las que se encuentra inscripto.
-- Si un socio no se encuentra inscripto a ninguna actividad debe figurar en el listado contabilizando 0. (XLS)
Select S.Apellidos, S.Nombres, Count(I.IDActividad) As Cantidad From Socios as S
Left Join Inscripciones AS I ON I.Legajo = S.Legajo
Group By S.Apellidos, S.Nombres

--El costo de actividad más alto por cada sede. Listar el nombre de la sede y el importe de la actividad más cara que se realiza allí (XLS).
Select S.Nombre, Max(A.Costo) As Maximo From Sedes as S
Inner Join Actividades as A ON A.IDSede = S.ID
Group By S.Nombre

--La cantidad de becados por género. Listar el género y la cantidad de becados de cada género.
Select S.Genero, Count(*) As CantidadBecados From Socios as S
Inner Join Inscripciones AS I ON S.Legajo = I.Legajo
Where I.Becado = 1
Group by S.Genero

--Por cada socio la cantidad de sedes distintas a las que asiste. Indicar el apellido y nombre del socio y la cantidad calculada (XLS).
Select S.Apellidos, S.Nombres, Count(Distinct A.IDSede) as CantSedes From Socios as S
Inner Join Inscripciones as I ON S.Legajo = I.Legajo
Inner Join Actividades as A ON A.ID = I.IDActividad
Group By S.Apellidos, S.Nombres

--La cantidad de pagos de distinto importe registrados.
Select Count(Distinct Importe) As Cantidad From Pagos

--La sumatoria de importes abonados por cada socio. 
--Listar el apellido y nombres de los socios y el total abonado. Sólo listar los socios que hayan abonado más de $3000 en total. (XLS)
Select S.Apellidos, S.Nombres, Sum(P.Importe) As SumaPagos From Socios as S
Inner Join Pagos as P ON P.Legajo = S.Legajo
Group By S.Apellidos, S.Nombres
Having Sum(P.Importe) > 3000

--La sumatoria de importes menores a $1000 abonados por cada socio. Listar el apellido y nombres de los socios y el total abonado. 
--Sólo listar los socios que hayan abonado más de $3000. (XLS)
Select S.Apellidos, S.Nombres, Sum(P.Importe) As SumaPagos From Socios as S
Inner Join Pagos as P ON P.Legajo = S.Legajo
Where P.Importe < 1000
Group By S.Apellidos, S.Nombres
Having Sum(P.Importe) > 3000

--La cantidad de actividades realizadas por socio. Listar el apellido y nombres de todos los socios y la cantidad de actividades en las que se encuentra inscripto. 
-- Sólo listar los socios que realicen más de una actividad.
Select S.Apellidos, S.Nombres, Count(*) As CantidadActividades From Socios as S
Inner Join Inscripciones AS I ON I.Legajo = S.Legajo
Group By S.Apellidos, S.Nombres
Having Count(*) > 1

--La cantidad de socios por actividad. Listar el nombre de la actividad y la cantidad de socios inscriptos a ella.
Select A.Nombre, Count(*) As Cantidad From Actividades as A
Inner Join Inscripciones as I ON I.IDActividad = A.ID
Group by A.Nombre

--Las actividades que no posean socios inscriptos. Listar el nombre de la actividad.
Select A.Nombre As Cantidad From Actividades as A
Left Join Inscripciones as I ON I.IDActividad = A.ID
Group by A.Nombre
Having Count(I.IDInscripcion) = 0