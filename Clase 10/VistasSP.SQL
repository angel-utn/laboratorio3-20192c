-- Vistas

-- 1) Hacer una vista que permita ver para cada socio los nombres de las actividades
-- y sedes donde las realiza.

-- 2) Hacer una vista que permita ver para cada actividad, el nombre y
-- la cantidad de socios inscriptos que posee.

-- 3) Hacer una vista que permita ver para cada socio, el apellido, nombres y la
-- cantidad de actividades en la que se encuentre becado.

-- 4) Hacer una vista que permita ver para cada socio, el apellido y nombre,
-- el mes y año del pago y el importe del pago.

-- 5) Hacer una vista que permita ver para cada socio el apellido y nombre,
-- el género, la cantidad de pagos realizados y el importe total en concepto de
-- pagos.

--- Procedimientos almacenados

-- 1) Hacer un procedimiento almacenado que permita listar la información de
-- todas las actividades

-- 2) Hacer un procedimiento almacenado que permita listar la información de
-- todas las actividades a partir del Apto médico. El procedimiento recibirá
-- un 1 para listar las actividades que requieren apto médico o un 0
-- para las que no requieren apto médico.

-- 3) Hacer un procedimiento almacenado que reciba un legajo de socio y
-- liste todas las actividades que realiza ese socio.

-- 4) Hacer un procedimiento almacenado que reciba un legajo de socio y un
-- número de año y liste todos los pagos realizados por ese socio en ese año.

-- 5) Hacer un procedimiento almacenado que reciba un legajo de socio y un
-- número de año y liste el total abonado por ese socio a lo largo del año.

-- 6) Hacer un procedimiento almacenado que reciba un legajo de socio y un
-- código de actividad y beque a dicho socio en esa actividad. El procedimiento
-- debe contemplar dos situaciones:
-- A) El socio ya se encuentre inscripto a la actividad, por lo tanto, se modifica
-- su estado de Becado.
-- B) El socio no se encuentra inscripto a la actividad, por lo tanto, se lo
-- inscribe becado a la actividad.

-- 7) Hacer un procedimiento almacenado que permita inscribir un socio a una
-- actividad. Se debe recibir el Legajo, el código de actividad y el estado
-- de beca. El procedimiento debe asegurar que un socio no pueda estar becado
-- en más de dos actividades a la vez. En caso de que esto ocurra, listar un
-- mensaje de error y no registrar la inscripción. De lo contrario, inscribir al socio

-- 8) Hacer un procedimiento almacenado que permita registrar un pago de un socio.
-- El procedimiento debe recibir el Legajo, mes y año y calcular el importe del
-- pago. Para ello deberá sumar el costo de todas las actividades que realice el
-- socio en las que no se encuentre becado. Tener en cuenta que el importe puede
-- ser cero.

-- 9) Hacer un procedimiento almacenado que permita eliminar un socio. Para ello
-- debe realizar, además, la eliminación de: 
-- Todos los pagos e inscripciones del socio.

-- 10) Hacer un procedimiento almacenado que reciba un valor Decimal(5, 2) y
-- permita aumentar porcentualmente el costo de todas las actividades 
-- a partir de dicho valor. Generar una excepción si el valor 
-- recibido no es positivo. 