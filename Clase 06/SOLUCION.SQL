-- 1) Las actividades con el mayor costo.
Select * From Actividades where Costo = (Select Max(Costo) From Actividades)

-- 2) Los pagos con el menor importe.
Select * From Pagos Where Importe = (Select Min(Importe) From Pagos)

-- 3) Las actividades cuyo precio sea mayor al precio promedio (XLS).
Select * From Actividades Where Costo > (Select AVG(Costo) From Actividades)

-- 4) Los socios que no se inscribieron a ninguna actividad (XLS).
Select * From Socios Where Legajo not in (Select distinct Legajo from Inscripciones)

-- 5) Las actividades que no registran ningún socio inscripto.
Select * From Actividades Where ID not in (Select distinct IDActividad From Inscripciones)

-- 6) Las actividades que no registran ningún socio becado (XLS).
Select * From Actividades where ID not in (
    Select distinct IDActividad From Inscripciones Where Becado = 1
)

-- 7) Las actividades cuyo costo sea mayor a alguna actividad que requiera Apto Médico (XLS).
Select * From Actividades Where Costo > SOME (
    Select Costo From Actividades Where AptoMedico = 1
)

-- 8) Las actividades cuyo costo sea menor a toda actividad que requiera Apto Médico (XLS).
Select * From Actividades Where Costo > ALL (
    Select Costo From Actividades Where AptoMedico = 1
)

-- 9) Las actividades cuyo costo sea mayor a toda actividad que se realice en la Sede 2.
Select * From Actividades Where Costo > ALL (
    Select Costo From Actividades Where IDSede = 2
)

-- 10) Por cada actividad, el nombre y la cantidad de inscriptos de género masculino y la cantidad de
-- inscriptos de género femenino.
Select A.Nombre, 
    (
        Select Count(*) From Socios as S INNER JOIN Inscripciones AS I
        ON S.Legajo = I.Legajo WHERE S.Genero = 'F' AND I.IDActividad = A.ID
    ) AS CantF,
    (
        Select Count(*) From Socios as S INNER JOIN Inscripciones AS I
        ON S.Legajo = I.Legajo WHERE S.Genero = 'M' AND I.IDActividad = A.ID
    ) AS CantM
From Actividades as A


-- 11) Por cada socio, la cantidad de actividades que requieren apto médico que realiza y la cantidad de
-- actividades que no requieren apto médico (XLS).
Select S.Apellidos, S.Nombres,
(
    Select Count(*) From Actividades as A Inner Join Inscripciones AS I
    ON I.IDActividad = A.ID WHERE A.AptoMedico = 1 And I.Legajo = S.Legajo
) As Requiere,
(
    Select Count(*) From Actividades as A Inner Join Inscripciones AS I
    ON I.IDActividad = A.ID WHERE A.AptoMedico = 0 And I.Legajo = S.Legajo
) As NoRequiere
From Socios as S

-- 12) La cantidad de actividades que registraron la misma cantidad de socios de género masculino
-- que socios de género femenino.
Select Count(*) From (
    Select A.Nombre, 
        (
            Select Count(*) From Socios as S INNER JOIN Inscripciones AS I
            ON S.Legajo = I.Legajo WHERE S.Genero = 'F' AND I.IDActividad = A.ID
        ) AS CantF,
        (
            Select Count(*) From Socios as S INNER JOIN Inscripciones AS I
            ON S.Legajo = I.Legajo WHERE S.Genero = 'M' AND I.IDActividad = A.ID
        ) AS CantM
    From Actividades as A
) As Aux
Where Aux.CantF = Aux.CantM

-- 13) El porcentaje de inscripciones realizadas en el año actual con respecto al total de inscripciones.
Select 
(
    Select Count(*) * 100.0 From Inscripciones
    Where Year(FechaInscripcion) = Year(Getdate()) 
) /
(
    Select Count(*) From Inscripciones
) As Porcentaje

-- 14) Las actividades que registran la misma cantidad de socios de género masculino que socios de
-- género femenino.
Select * From (
    Select A.Nombre, 
        (
            Select Count(*) From Socios as S INNER JOIN Inscripciones AS I
            ON S.Legajo = I.Legajo WHERE S.Genero = 'F' AND I.IDActividad = A.ID
        ) AS CantF,
        (
            Select Count(*) From Socios as S INNER JOIN Inscripciones AS I
            ON S.Legajo = I.Legajo WHERE S.Genero = 'M' AND I.IDActividad = A.ID
        ) AS CantM
    From Actividades as A
) As Aux
Where Aux.CantF = Aux.CantM

-- 15) Los socios que realizan únicamente actividades que no requiere apto médico.
Select Lista.* From (
    Select S.Apellidos, S.Nombres,
    (
        Select Count(*) From Actividades as A Inner Join Inscripciones AS I
        ON I.IDActividad = A.ID WHERE A.AptoMedico = 1 And I.Legajo = S.Legajo
    ) As Requiere,
    (
        Select Count(*) From Actividades as A Inner Join Inscripciones AS I
        ON I.IDActividad = A.ID WHERE A.AptoMedico = 0 And I.Legajo = S.Legajo
    ) As NoRequiere
    From Socios as S
) As Lista
Where Lista.NoRequiere > 0 And Lista.Requiere = 0

-- 16) Los socios que realicen más actividades que requieren apto médico que actividades que no lo
-- requieran y que al menos realicen una actividad que no requiera apto médico (XLS).
Select Lista.* From (
    Select S.Apellidos, S.Nombres,
    (
        Select Count(*) From Actividades as A Inner Join Inscripciones AS I
        ON I.IDActividad = A.ID WHERE A.AptoMedico = 1 And I.Legajo = S.Legajo
    ) As Requiere,
    (
        Select Count(*) From Actividades as A Inner Join Inscripciones AS I
        ON I.IDActividad = A.ID WHERE A.AptoMedico = 0 And I.Legajo = S.Legajo
    ) As NoRequiere
    From Socios as S
) As Lista
Where Lista.Requiere > Lista.NoRequiere And Lista.NoRequiere > 0