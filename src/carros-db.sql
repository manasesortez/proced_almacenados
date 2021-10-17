CREATE DATABASE autos

GO
USE autos
GO

CREATE TABLE marca
(
id_marca int identity(1,1),
marca varchar(15),
pais varchar(15),
CONSTRAINT pk_marca PRIMARY KEY(id_marca)
)

CREATE TABLE modelos
(
id_modelos int identity(1,1),
modelo varchar(15),
asientos int,
combustible varchar(10),
precio smallmoney,
year_modelo varchar(4),
id_marca int,
CONSTRAINT pk_modelos PRIMARY KEY(id_modelos),
CONSTRAINT fk_modelos FOREIGN KEY(id_marca)
REFERENCES marca(id_marca)
)

CREATE TABLE repuestos
(
id_rep int identity(1,1),
nombre varchar(40),
precio smallmoney,
descuento int,
id_modelos int,
CONSTRAINT pk_repuesto PRIMARY KEY(id_rep),
CONSTRAINT fk_repuestos FOREIGN KEY(id_modelos)
REFERENCES modelos(id_modelos)
)

SELECT * FROM marca;
SELECT * FROM modelos;
SELECT * FROM repuestos;

INSERT INTO marca VALUES ('Toyota','Japon')
INSERT INTO marca VALUES ('Kia','Corea')
INSERT INTO marca VALUES ('Fiat','Italia')
INSERT INTO marca VALUES ('Chevrolet','USA')
INSERT INTO marca VALUES ('Mercedez','Alemania')
INSERT INTO marca VALUES ('Honda','Japon')

INSERT INTO modelos VALUES ('Civic',4,'Gasolina',10000,'2010',6)
INSERT INTO modelos VALUES ('CRX',4,'Gasolina',6800,'1995',6)
INSERT INTO modelos VALUES ('300 SL',4,'Gasolina',16800,'2004',5)
INSERT INTO modelos VALUES ('Chevy',4,'Gasolina',9800,'1999',4)
INSERT INTO modelos VALUES ('Camaro',5,'Gasolina',12800,'2001',4)
INSERT INTO modelos VALUES ('Aveo',5,'Gasolina',9300,'2000',4)
INSERT INTO modelos VALUES ('Malibu',5,'Gasolina',8000,'2007',4)
INSERT INTO modelos VALUES ('Uno',5,'Gasolina',6800,'2007',3)
INSERT INTO modelos VALUES ('Cerato',5,'Gasolina',9000,'2011',2)
INSERT INTO modelos VALUES ('Rio',5,'Gasolina',13000,'2010',2)

INSERT INTO repuestos VALUES ('Manecia',12.3,10,1)
INSERT INTO repuestos VALUES ('Empaque de Culata',21.6,10,2)
INSERT INTO repuestos VALUES ('Bomper delantero',25.7,10,9)
INSERT INTO repuestos VALUES ('Filtro de aire',10,10,1)
INSERT INTO repuestos VALUES ('Parabrisas delantero',17.8,10,3)
INSERT INTO repuestos VALUES ('Timon ajustable',58.5,10,8)
INSERT INTO repuestos VALUES ('Liquido de Frenos',3.43,10,1)
INSERT INTO repuestos VALUES ('Amortiguadores',50,10,2)
INSERT INTO repuestos VALUES ('Perno Llantas',7,10,1)
INSERT INTO repuestos VALUES ('PUerta conductor',8.98,10,1)
INSERT INTO repuestos VALUES ('Bonba de Gasolina',37.7,10,2)
INSERT INTO repuestos VALUES ('Bujillas especiales',22,10,4)
INSERT INTO repuestos VALUES ('Asiento',125,10,1)
INSERT INTO repuestos VALUES ('Chapa baul',25.8,10,3)
INSERT INTO repuestos VALUES ('Faja Distribuidor',34.3,10,1)
INSERT INTO repuestos VALUES ('Pintura carroceria',65,10,7)
INSERT INTO repuestos VALUES ('Cable alternador',14,10,2)
INSERT INTO repuestos VALUES ('Cable bateria',4.60,10,1)
INSERT INTO repuestos VALUES ('Aditivos Motor',9.7,10,1)
INSERT INTO repuestos VALUES ('Aditivos Motor',13.6,20,2)
INSERT INTO repuestos VALUES ('Prensa de Clocth',140.3,20,1)
INSERT INTO repuestos VALUES ('Prensa de Clocth',100.3,20,2)
INSERT INTO repuestos VALUES ('Disco Frenos',21.2,20,4)
INSERT INTO repuestos VALUES ('Disco Frenos',29.90,20,5)
INSERT INTO repuestos VALUES ('Pastillas',2.3,20,2)
INSERT INTO repuestos VALUES ('ROLES PILOTO',10,20,6)
INSERT INTO repuestos VALUES ('Manecia',22,20,1)
INSERT INTO repuestos VALUES ('Manecia',43.1,20,2)
INSERT INTO repuestos VALUES ('Relay de arranque',11,20,9)
INSERT INTO repuestos VALUES ('Relay de arranque',37.2,20,7)
INSERT INTO repuestos VALUES ('BUSHING DE CREMALLERA',25,30,8)
INSERT INTO repuestos VALUES ('BUSHING DE CREMALLERA',15,30,3)
INSERT INTO repuestos VALUES ('Manecia',20,30,2)
INSERT INTO repuestos VALUES ('Silvines',32,30,2)
INSERT INTO repuestos VALUES ('Silvines',56,45,7)
INSERT INTO repuestos VALUES ('Silvines',7.8,30,2)
INSERT INTO repuestos VALUES ('Platinos',21.6,30,1)
INSERT INTO repuestos VALUES ('Platinos',17.3,30,2)
INSERT INTO repuestos VALUES ('Condensador',45,30,4)
INSERT INTO repuestos VALUES ('Condensador',2.3,30,3)
INSERT INTO repuestos VALUES ('Alternadores',34.23,30,5)

/**Exsercise Storage Procedure**/
CREATE PROCEDURE ModeloxMarca
    @busca varchar(15)
AS
BEGIN
    SELECT marca.marca, modelos.modelo, modelos.precio
    FROM marca INNER JOIN modelos ON marca.id_marca = modelos.id_marca
    WHERE marca.marca LIKE @busca
END

/**Diseñar el procedimiento almacenado de tal forma que no requiera parametros
  de entrada.**/
CREATE PROCEDURE ModeloxMarcaInsertDefault
    (@busca varchar(15) = 'Honda')
AS
BEGIN
    SELECT marca.marca, modelos.modelo, modelos.precio
    FROM marca INNER JOIN modelos ON marca.id_marca = modelos.id_marca
    WHERE marca.marca LIKE @busca
END

/**Ejecutar el procedimiento almacenados anteriores**/
EXEC ModeloxMarcaInsertDefault
EXEC ModeloxMarca @busca = 'Honda'

/**Desarrollar los siguientes ejercicios en equipos de trabajo:**/

/**
  1. Cree un procedimiento almacenado para mostrarme una lista de repuestos con
  su nombre, precio, porcentaje de descuento y el valor que tuviera si se aplica
  dicho descuento.
**/
CREATE PROCEDURE ViewRepuestos
AS
BEGIN
    SELECT repuestos.nombre AS NOMBRE,
           repuestos.precio AS PRECIO,
           CONCAT(repuestos.descuento, '%') AS [DESCUENTO],
           repuestos.precio - (repuestos.precio * repuestos.descuento / 100) AS [PRECIO FINAL]
    FROM repuestos INNER JOIN modelos ON repuestos.id_modelos = modelos.id_modelos
END

EXEC ViewRepuestos

/**
2. Elabore otro que tenga un parametro que me pida el modelo del auto, y que
  me muestre todos los repuestos que pertenecen a ese modelo de auto.
**/

CREATE PROCEDURE RepuestoxModelo
     @busca varchar(15)
AS
BEGIN
    SELECT modelos.modelo AS MODELO,
           repuestos.nombre AS [NOMBRE REPUESTO],
           repuestos.precio AS PRECIO,
           CONCAT(repuestos.descuento, '%') AS [DESCUENTO],
           repuestos.precio - (repuestos.precio * repuestos.descuento / 100) AS [PRECIO FINAL]
    FROM repuestos INNER JOIN modelos ON repuestos.id_modelos = modelos.id_modelos
    WHERE modelos.modelo LIKE @busca
END

EXEC RepuestoxModelo 'Civic'

/**
3. Ahora elabore uno que muestre la marca, el paıs, el nombre del modelo y
  el precio, pero que me pida dos parametros, paıs y precio, para usarlo
  en la busqueda
**/

CREATE PROCEDURE MarcaxPrice
     (@Pais varchar(15), @Precio smallmoney)
AS
BEGIN
    SELECT marca.marca AS MARCA,
           modelos.modelo AS MODELO,
           marca.pais AS PAIS,
           modelos.precio AS PRECIO
    FROM marca INNER JOIN modelos ON marca.id_marca = modelos.id_marca
    WHERE marca.pais LIKE @Pais AND modelos.precio LIKE @Precio
END

EXEC MarcaxPrice 'Japon','10000'

/**
4. Tambien elabore uno que me muestre los datos del repuesto, modelo y marca,
  a partir de que el precio de los repuestos, este entre dos valores.
 **/

CREATE PROCEDURE RepuestoxModeloxMarca
     (@PrecioMax smallmoney, @PrecioMin smallmoney)
AS
BEGIN
    SELECT marca.marca AS MARCA,
           modelos.modelo AS MODELO,
           marca.pais AS PAIS,
           modelos.precio AS PRECIO,
           modelos.asientos AS ASIENTOS,
           modelos.combustible AS [MAX COMBUSTIBLE],
           modelos.year_modelo AS [AÑO FABRICACION],
           repuestos.nombre AS [REPUESTO NOMBRE],
           repuestos.precio AS [REPUESTO PRECIO]
    FROM repuestos
        INNER JOIN modelos ON repuestos.id_modelos = modelos.id_modelos
        INNER JOIN marca ON modelos.id_marca = marca.id_marca
    WHERE repuestos.precio BETWEEN @PrecioMin AND @PrecioMax
END

DROP PROCEDURE RepuestoxModeloxMarca;

EXEC RepuestoxModeloxMarca '25.7','12.3'

/**
  5. Cree una lista de modelos y que muestre la cantidad de repuestos
  que hay por cada modelo.
 */

CREATE PROCEDURE Get_RespuestosCantidadxModelos
AS
BEGIN
    SELECT marca.marca AS MARCA,
           modelos.modelo AS MODELO,
           marca.pais AS PAIS,
           modelos.precio AS PRECIO
    FROM repuestos
        INNER JOIN modelos ON repuestos.id_modelos = modelos.id_modelos
        INNER JOIN marca ON modelos.id_marca = marca.id_marca
END
