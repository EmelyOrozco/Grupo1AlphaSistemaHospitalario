Create Database PROYECTOFINAL_FRANCISCO
use PROYECTOFINAL_FRANCISCO/*COLOCAR BASE DE DATOS PROYECTO FINAL*/


 --PRIMER TABLA DE PACIENTES--
CREATE TABLE [paciente] (
  [DPI_PACIENTE] int IDENTITY(1223455,1),
  [Nombre] Varchar(50),
  [Apellido] Varchar(50),
  [Direccion] Varchar(50),
  [Fecha_Ingreso] Date,
  PRIMARY KEY ([DPI_PACIENTE]) 
);


CREATE TABLE [Area] (
  [ID_AREA] Int IDENTITY (10,1),
  [Nombre] Varchar(50),
  PRIMARY KEY ([ID_AREA])
);

CREATE TABLE [Empleado] (
  [ID_EMPLEADO] Int IDENTITY (1,2),
  [Nombre] Varchar(50),
  [Apellido] Varchar(50),
  [Puesto] Varchar(50),
  [ID_AREA] Int,
  [Telefono] Varchar(50),
  [Sueldo] Real,
  [ID_JEFE] Int,
  PRIMARY KEY ([ID_EMPLEADO]),
  FOREIGN KEY ([ID_AREA]) References [Area]
);

CREATE TABLE [Consulta] (
  [ID_CONSULTA] Int IDENTITY (1,1),
  [DPI_PACIENTE]  int,
  [ID_EMPLEADO]  int,
  [ID_AREA]  int,
  [Fecha_Ingreso] Date,
  [Padecimiento] Varchar(50),
  [Estado] Varchar(50),
  PRIMARY KEY ([ID_CONSULTA]),
  FOREIGN KEY ([DPI_PACIENTE]) References [paciente],
  FOREIGN KEY ([ID_EMPLEADO])  References [Empleado],
  FOREIGN KEY ([ID_AREA]) References [Area]
);

CREATE TABLE [Factura] (
  [ID_FACTURA] Int IDENTITY (1,1),
  [ID_CONSULTA]  int,
  [Nombre] Varchar(50),
  [Direccion] Varchar(50),
  [Fecha] Date,
  [Telefono] Varchar(50),
  [NIT] Varchar(50),
  [Total] Int,
  PRIMARY KEY ([ID_FACTURA]),
  FOREIGN KEY ([ID_CONSULTA]) References [Consulta]
);



-----------------------

-----------------------
SELECT * from Consulta
------------------------

INSERT INTO paciente ([Nombre] ,Apellido, [Direccion],Fecha_Ingreso) Values

('MARIAJOSE','CADENAS','GUATEMALA','2020/11/13'),
('JUANA','DE ARCO','SAN CRISTOBAL','2020/04/28'),
('JEFRI','MILIAN','GUATEMALA','2020/06/26'),
('ANDREA','FiGUEROA','SAN JUAN','2020/01/14'),
('SAYDA','MORATAYA','JALAPA','2020/03/16'),
('DAYANIRA','LOPEZ','PETEN','2020/10/12'),
('FERNANDA','PEREZ','MIXCO','2020/10/28');

INSERT INTO Area ([Nombre])
Values
('ADMINISTRATIVA '),
('CIRUGIA'),
('PEDIATRIA'),
('INVESTIGACION'),
('MEDICINA INTERNA'),
('CIRUJIA'),
('EMERGENCIAS');

INSERT INTO Empleado ([Nombre], Apellido, [Puesto], ID_AREA, [Telefono], Sueldo, [ID_JEFE])
Values
('JULIO','MINEZOTA','GERENTE GENERAL',10,'32298402',30000,NULL),
('ALEX','BARRERA','CONSERJE',10,'24837474',2000,'1'),
('PEDRO','RODRIGEZ','JEFE DE DEPARTAMENTO DE CIRUGIA ',14,'56108261',12000,'1'),
('RAMIRO','ROCA','MEDICO CIRUGANA ',14,'80502456',15000,'13'),
('JESUS','VALENZUELA','JEFE DE DEPARTAMENTO DE PEDIATRIA',12,'74748324',7000,'1'),
('JOSMAR','CADENAS','MEDICO PEDIATRA',12,'12345678',5000,'17'),
('EMMANUEL','CRUZ','CONSERJE',10,'47848456',2000,'1'),
('MELISSA','FIGUEROA','MEDICO PEDIATRA',11,'41258323',4800,'17'),
('FEDERICO','GUTIRREZ','ENFERMERO CIRUJANO',14,'78794009',2850,'15'),
('MANUEL','FERNANDEZ','MEDICO CIRUJANO',14,'35362006',16000,'13')
;

INSERT INTO Consulta([DPI_PACIENTE],ID_EMPLEADO,[ID_AREA],Fecha_Ingreso,[Padecimiento],Estado)
VALUES
(1223455,15,12,'12/01/2021','INFECCION INTESTINAL','PENDIENTE'),
(1223456,17,16,'02/02/2021','RUPTURA DE BRAZO','NO Pendiente'),
(1223457,17,13,'10/02/2021','SINTOMAS DE COVID','PENDIENTE'),
(1223458,19,16,'15/02/2021','CORTADURA INTESTINAL','NO Pendiente'),
(1223459,7,15,'18/02/2021','OPERACION DEL CORAZON ','PENDIENTE'),
(1223460,11,14,'01/03/2021','INFECCION URINARIA','NO Pendiente')
;

INSERT INTO Factura ( ID_CONSULTA, [Nombre] , Direccion, [Fecha], Telefono, [NIT], Total)
VALUES
(2,'JUANA','SAN CRISTOBAL','02/02/2021','33418740','87908-9',15000),
(4,'ANDREA','JALAPA','15/02/2021','34335610','54589-19',32000),
(6,'JASMIN','GUATEMALA','01/03/2021','41208404','83418-9',11000)
;


------------------------------------------------------------------------------------------------------------------
-------------------------------------------METODOS JOIN-----------------------------------------------------------
------------------------------------------------------------------------------------------------------------------


select * from Empleado 

Select subordinado.ID_Empleado, subordinado.Nombre Empleado, subordinado.Puesto,
jefe.Nombre As JEFE, jefe.Puesto , jefe.ID_Jefe AS ID_DEL_JEFE
FROM Empleado As subordinado
inner join Empleado As jefe on jefe.ID_Empleado = subordinado.ID_Jefe