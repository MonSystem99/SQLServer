/* Agregar columnas en una tabla*/
ALTER TABLE Alumno ADD Direccion VARCHAR(500)
ALTER TABLE Alumno ADD Telefono VARCHAR(10)

/* Borrar una columna de la tabla*/
ALTER TABLE AlumnoPorDiseñador DROP COLUMN Apellido
ALTER TABLE AlumnoPorDiseñador DROP COLUMN Edad

/* Insertar Datos*/
INSERT INTO Alumno (Nombre,Apellido,Edad,Sexo,Telefono )
VALUES ('Carlos','Garay',25,'Masculino','3114-2332')

SELECT * FROM Alumno

/* Actualizar Datos*/
UPDATE Alumno SET Direccion = 'Tegocigilo Honduras' WHERE AlumnoID = 1
UPDATE Alumno SET Direccion = 'San Pedro Sola Honduras' WHERE AlumnoID = 2

/* Borrar un registro de Datos*/
SELECT * from Alumno

DELETE Alumno where AlumnoID = 1

insert into Alumno(Nombre, Apellido, Edad, Sexo)
VALUES ('Tomas', 'Gonzalez', 55, 'Masculino')


/* CLAUSULAS Ingresar nueva tabla y Datos*/
SELECT * FROM Mestro

CREATE TABLE Mestro(MaestroID INT PRIMARY KEY IDENTITY (1,1), Nombre VARCHAR(100), Apellido VARCHAR(100),Correo VARCHAR(500),
Direccion VARCHAR(500), Edad INT, Sueldo MONEY, FechaDeIngreso DATE, Telefono VARCHAR(20)
)


INSERT INTO Mestro (Nombre, Apellido,Correo, Direccion, Edad, Sueldo, FechaDeIngreso, Telefono)
VALUES ('Estefani', 'Bonilla', 'estefani@gmail.com', 'San Pedro Sula Honduras', 20, 2500, 
'12-25-2019', '2545-8569' )

INSERT INTO Mestro (Nombre, Apellido,Correo,Direccion,Edad,Sueldo,FechaDeIngreso, Telefono)
VALUES ('Estefania','Gonzalez','estefani@gmail.com', 'San Pedro Sula Honduras', 29, 2500, '12-20-2018','231-3341')

INSERT INTO Mestro ( Nombre, Apellido,Correo,Direccion,Edad,Sueldo,FechaDeIngreso, Telefono)
VALUES ('Fernando','Jimenez','fernandoj@gmail.com', 'San Jacinto Honduras',23, 2500,'12-20-2018','0145-0914')

INSERT INTO Mestro (Nombre, Apellido,Correo,Direccion,Edad,Sueldo,FechaDeIngreso, Telefono)
VALUES ('Martha','Lopez','marthasol@gmail.com', 'San flores de Sula Honduras',23, 2500, '12-20-2018','001-3317')

INSERT INTO Mestro( Nombre, Apellido,Correo,Direccion,Edad,Sueldo,FechaDeIngreso, Telefono)
VALUES ('Susana','Florencia','susanaf@gmail.com', 'San Pedro Sula Honduras',45, 8000, '05-10-2014','1087-1288')

INSERT INTO Mestro( Nombre, Apellido,Correo,Direccion,Edad,Sueldo,FechaDeIngreso, Telefono)
VALUES ('Ramiro','Sanchez','ramiroz@gmail.com', 'San Pedro Sula Honduras',34, 2900, '02-10-2018','1120-1091')


/* WHERE  -DONDE*/

Select * from Mestro

SELECT * FROM Mestro WHERE Direccion = 'San Pedro Sula Honduras'
SELECT * FROM Mestro WHERE Sueldo = '2500'
Select * from Mestro WHERE Nombre = 'Estefania'


/* ORDER BY ordena los resultados ya se ascendente o descendente*/
Select * from Mestro order by  Sueldo desc
select * from Mestro order by Nombre desc
select * from Mestro order by Nombre asc


/* TOP - limitar registros - hace que la consulta sea mas rapida para consumir menos recurso en el sistema cuando existen
muchos datos en la tabla y BD*/
SELECT * FROM Mestro
Select top 2 * From Mestro Order by MaestroID desc 
select top 2 Nombre, Apellido,Direccion from Mestro order by MaestroID desc
select top 1 * from Mestro Where MaestroID = 3 order by MaestroID desc

/* DISTINC Seleccionar datos que no esten repetidos */
SELECT DISTINCT Apellido from Mestro
SELECT DISTINCT Direccion from Mestro

/* GROUP BY  agrupa datos como DISTINCT*/
SELECT * FROM Mestro
UPDATE Mestro SET Direccion = 'San Pedro Sula Honduras' WHERE MaestroID = 3

SELECT Apellido, Direccion FROM Mestro GROUP BY Apellido, Direccion
SELECT Apellido,Direccion , SUM(sueldo) FROM Mestro GROUP BY Apellido,Direccion
Select Direccion FROM Mestro GROUP BY Direccion


/* Crear tabla de Proyectos */
Select * from Producto

CREATE TABLE Producto ( ProductoID INT PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR(500), PrecioEspecial MONEY, PrecioPublico MONEY, Stock INT)

INSERT INTO Producto(Nombre, PrecioEspecial, PrecioPublico, Stock)
VALUES ('Malteada',8.0,10.0,20)

INSERT INTO Producto VALUES ('Pan',8.0,10.0,20)
INSERT INTO Producto VALUES ('Cafe',7.0,8.5,25)
INSERT INTO Producto VALUES ('Cafe con pan', 5.0, 6.5, 50)
INSERT INTO Producto VALUES ('Dulce de Leche',8.0, 10.5, 10)
INSERT INTO Producto VALUES ('Pastel de tres leches',15.0, 17.5, 5)
INSERT INTO Producto VALUES ('Pastel de Chocolate',12.0, 14.0, 8)

/* ============= OPERADORES LOGICOS
 ================= OPERADOR AND   ============= para aplicar en un where*/
 SELECT * FROM Producto
 SELECT * FROM Producto WHERE PrecioEspecial >8 AND Stock <=8

 SELECT * FROM Producto WHERE PrecioEspecial >8 AND PrecioEspecial <=12
 SELECT * FROM Producto WHERE PrecioEspecial <=8 and PrecioEspecial <=12 
 and Stock = 8

 
/* ============= OPERADORES LOGICOS
 ================= OPERADOR OR seleccions un producto o si no otro producto  =======*/

 select * from Producto WHERE ProductoID > 4 AND Stock > 5

 SELECT * FROM Producto WHERE ProductoID > 4 OR Stock > 10
 SELECT * FROM Producto WHERE ProductoID > 4 OR Nombre = 'Pan'


 
/* ============= OPERADORES LOGICOS 
OPERADOR IN - DONDE se usa en edad, fecha, sueldo entre otros, se usa dentro de Wehere */
select * from Mestro
INSERT INTO Mestro VALUES ( 'Elmer', 'Gonzalez','elmer@hotmail.com','San Silver de las Flores',
25, 1230,'12/15/2020','123-0812') /* crear un nuevo registro en la tabla*/

SELECT * FROM Mestro WHERE Nombre = 'Elmer'
SELECT * FROM Mestro WHERE Nombre IN ('Elmer','Susana')
SELECT * FROM Mestro WHERE Edad IN (20,18)
SELECT * FROM Mestro WHERE Sueldo IN (2500)

/* ============= OPERADORES LOGICOS 
OPERADOR LIKE  */
select * from Producto
SELECT * FROM Producto WHERE Nombre LIKE '%Pastel%' 
SELECT * FROM Producto WHERE Nombre LIKE '%Dulce%Leche%'-- buscar varias palabras 
SELECT * FROM Producto WHERE Nombre LIKE '%ada%' -- Busca una palabra
SELECT * FROM Producto WHERE Nombre LIKE '%cafe%' -- Busca una palabra
SELECT * FROM Producto WHERE Nombre LIKE '%p%' -- Busca una palabra


/* ============= OPERADORES LOGICOS 
OPERADOR - NOT IN - Negar o buscar resultados que no son definidos por un parametro */
select * from Mestro
select * from Mestro WHERE NOT MaestroID = 3
SELECT * FROM MESTRO WHERE NOT Edad = 20 AND NOT MaestroID = 3
SELECT * FROM Mestro WHERE Nombre NOT IN ('Elmer','Estefania')

/* =============Creat Tabla CLASE */
CREATE TABLE Clase(
	ClaseID int primary key identity(1,1),
	Nombre VARCHAR(100),
	FechaApertura Date,
	HoraClase VARCHAR(10), --   1800,2000 
	MaestroNombre VARCHAR(100),
	Precio Money,
	AlumnoNombre VARCHAR(100)
)

SELECT * from Clase

INSERT INTO Clase (Nombre, FechaApertura, HoraClase, MaestroNombre, Precio, AlumnoNombre)
VALUES ('Español','03-18-2020', '2000', 'Estafani Hernandez', 200, 'Rojer Rojas')


INSERT INTO Clase (Nombre, FechaApertura, HoraClase, MaestroNombre, Precio, AlumnoNombre)
VALUES ('Matematicas','03-18-2020', '2100', 'Estafani Hernandez', 220, 'Rojer Rojas')

INSERT INTO Clase (Nombre, FechaApertura, HoraClase, MaestroNombre, Precio, AlumnoNombre)
VALUES ('Ingles','03-18-2020', '2200', 'Carmen Najera', 220, 'Rojer Rojas')


INSERT INTO Clase (Nombre, FechaApertura, HoraClase, MaestroNombre, Precio, AlumnoNombre)
VALUES ('Español','03-18-2020', '2000', 'Estafani Hernandez', 200, 'Ana Gutierrez')


INSERT INTO Clase (Nombre, FechaApertura, HoraClase, MaestroNombre, Precio, AlumnoNombre)
VALUES ('Matematicas','03-18-2020', '2100', 'Estafani Hernandez', 220, 'Ana Gutierrez')

INSERT INTO Clase (Nombre, FechaApertura, HoraClase, MaestroNombre, Precio, AlumnoNombre)
VALUES ('Ingles','03-18-2020', '2200', 'Carmen Najera', 220, 'Ana Gutierrez')


/* ============= Relaciones */

Select * from Lugar
select * from Cliente

delete from Cliente where ClienteID = 1
delete from Cliente where ClienteID = 2

/* ============= Inner Join - */
Select  * from Alumno
Select  * from Clase
Select  * from Mestro
Select  * from Inscripcion


select * from Inscripcion  I INNER JOIN Clase C ON I.ClaseID = C.ClaseID

select  I.InscripcionID, I.Fecha, I.Hora, C.Nombre FROM Inscripcion I INNER JOIN Clase C ON I.ClaseID = C.ClaseID
INNER JOIN Alumno A ON I.AlumnoID = A.AlumnoID

select * from Alumno
select * from Mestro
select * from Clase
select * from Inscripcion
select * from AlumnoPorDiseñador


SELECT I.InscripcionID, I.fecha, I.Hora, C.Nombre [Nombre Clase], A.Nombre [Nombre Alumno], 
A.Direccion, M.Nombre [Nombre Maestro]
from Inscripcion I 
 INNER JOIN Clase C ON I.ClaseID = C.ClaseID
 INNER JOIN Alumno A ON I.AlumnoID = A.AlumnoID
 INNER JOIN Mestro M On I.MaestroID = M.MaestroID

/* ============= lEFT JOIN - TABLA DE LA IQUIERDA */

SELECT * from Mestro
Select * from Inscripcion

SELECT * from Mestro M LEFT JOIN Inscripcion I On I.MaestroID = M.MaestroID

SELECT * from inscripcion I LEFT JOIN Mestro M On I.MaestroID = M.MaestroID


/* ============= RIGTH JOIN - casi lo mismo que Left join pero alreves  */
SELECT * from Mestro
Select * from Inscripcion

select  * from Inscripcion I RIGHT JOIN Mestro M ON I.MaestroID = M.MaestroID
select  * from Mestro M RIGHT JOIN Inscripcion I  ON I.MaestroID = M.MaestroID



/* =============UNIR TABLAS TRANSPORTE */

select * from Chofer
select * from Cliente
select * from Lugar
select * from Viaje

insert into Lugar values ('Casa Teg', '4 avenidas, 3 calle avenida colima',3)
insert into Lugar values ('Terreno sol Teg', '34 avenidas, 9 calle avenida colima',3)
insert into Lugar values ('Milpas t teraza Teg', '9 avenidas, 30 calle avenida colima',4)
insert into Lugar values ('Cazares del mar', '91 avenidas, 70 calle avenida colima',5)


insert into Viaje (Fecha, ClienteID,ChoferID,LugarID, Precio)
Values (GETDATE(), 3,1,10,200)

select * from viaje v inner join cliente c on v.ClienteID = c.ClienteID
inner join Chofer ch ON v.ChoferID = ch.ChoferID  INNER JOIN lugar L on v.LugarID = L.LugarID


/* =============UNION Y UNION ALL */

select * from viaje
select * from cliente
 

 Select ClienteID from cliente union select ClienteID from Viaje


 /* =============CREAR VISTAS */

 create View vViajeRealizados  /* Crea la tabla view vViajeRealizados esto para no ingresar todo el select de abajo*/
 as
 Select V.ViajeID, V.Fecha, CONCAT(C.Nombre, ' ', C.Apellido) NombreCliente,
 L.Nombre Lugar, L.Direccion, CONCAT(Ch.Nombre, ' ' ,Ch.Apellido) NombreChofer
 from Viaje V 
 inner join Cliente C ON V.ClienteID = C.ClienteID
 inner join Chofer ch ON V.ChoferID = ch.ChoferID
 inner join Lugar L ON L.LugarID = L.LugarID


 select * from vViajeRealizados /*crea el select de la tabla view que habiamos creado */
 where ViajeID=4

 select COUNT(*)Viajes, NombreChofer from vViajeRealizados
 GROUP BY NombreChofer




 /*crea el select de la tabla view que habiamos creado ejercicio 1*/

 Select AlumnoID, Nombre,Apellido,Edad,Sexo,Direccion,
(Select COUNT(*) from inscripcion I where I.AlumnoID = A.AlumnoID)
 from Alumno A


  Select AlumnoID, Nombre,Apellido,Edad,Sexo,Direccion,
(Select SUM(InscripcionID) from inscripcion I where I.AlumnoID = A.AlumnoID)
 from Alumno A

  select SUM(Precio) from Inscripcion I inner join Clase C on I.ClaseID = C.ClaseID
  where I.AlumnoID = 2
    select SUM(Precio) from Inscripcion I inner join Clase C on I.ClaseID = C.ClaseID
  where I.AlumnoID = 1

    select ISNULL(SUM(Precio) ,0)from Inscripcion I inner join Clase C on I.ClaseID = C.ClaseID
  where I.AlumnoID = 1

  

 Select AlumnoID, Nombre,Apellido,Edad,Sexo,Direccion,
(Select COUNT(*) from inscripcion I where I.AlumnoID = A.AlumnoID) TotalClases,
   (
   select ISNULL(SUM(Precio) ,0)from Inscripcion I inner join Clase C on I.ClaseID = C.ClaseID
  where I.AlumnoID = A.AlumnoID
   )
   FROM Alumno A

   
 CREATE VIEW vAlumnosMatriculados
   AS
 Select AlumnoID, Nombre,Apellido,Edad,Sexo,Direccion,
(Select COUNT(*) from inscripcion I where I.AlumnoID = A.AlumnoID) TotalClases,
   (
	select ISNULL(SUM(Precio) ,0)from Inscripcion I inner join Clase C on I.ClaseID = C.ClaseID
	where I.AlumnoID = A.AlumnoID
   )
   SumTotal,
   (
	SELECT ISNULL(AVG(Precio),0) from Inscripcion I inner join Clase C on I.ClaseID = C.ClaseID
	Where AlumnoID = A.AlumnoID
	)PromedioPorClase
From Alumno A


-- Alumno de Ana = 3
-- ClaseID = 7
-- MaestroID = 3
INSERT INTO Inscripcion (Fecha,ClaseID,AlumnoID,MaestroID,Hora)
VALUES (GETDATE(),7,3,3, '1400')

SELECT * FROM vAlumnosMatriculados

 Select * from inscripcion where AlumnoID = 1
 select * from Clase
 select * from Inscripcion
 select * from Mestro
  select * from Alumno
 


 -- Declarar VARIABLES  con @
 DECLARE @TotalClaseDelAlumno INT = 500
 DECLARE @NombreDelAlumno VARCHAR(100)= 'Carlos  Garay'
 DECLARE @Numero1 INT = 1 , @Numero2 INT = 5, @Numero3 INT = 2

 Select @Numero1,@Numero2,@Numero3
 Select @TotalClaseDelAlumno, @NombreDelAlumno





