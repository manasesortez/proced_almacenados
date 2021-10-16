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