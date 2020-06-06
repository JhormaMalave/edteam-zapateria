# Valores de la base de datos

INSERT INTO paises(nombre)
VALUES
	('Venezuela'),
	('Peru'),
	('Colombia'),
	('Mexico'),
	('Paraguay'),
	('Ecuador'),
	('Argentina')
;

INSERT INTO clientes(dni, nombre, apellido, pais_id) 
VALUES
	(27574858,	'Jaime',	'Lannister',	7),
	(30974858,	'Tyrion',	'Lannister',	7),
	(22574859,	'Cercei',	'Lannister',	7),
	(4058495,	'Arya',		'Stark',		1),
	(5891564,	'Robb',		'Stark',		1),
	(5174858,	'Sansa',	'Stark',		1),
	(5174880,	'Jon',		'Snow',			1),
	(154842,	'Doran',	'Martell',		2),
	(846216,	'Elia',		'Martell',		2),
	(846218,	'Nymeria',	'Sand',			2),
	(2156481,	'Robert',	'Baratheon',	6),
	(2156847,	'Myrcela',	'Baratheon',	6),
	(1648621,	'Jofrey',	'Baratheon',	6),
	(1915184,	'Renly',	'Baratheon',	6),
	(251615,	'Robert',	'Arryn',		4),
	(1979956,	'Daenerys',	'Targaryen',	5),
	(26548684,	'Edmure',	'Tully',		3),
	(25654164,	'Arthur',	'Dayne',		3)
;

INSERT INTO productos(nombre, valor)
VALUES
	('Adidas',	250.15),
	('Nike',	199.99),
	('Puma',	99.99),
	('Inglese',	150.49),
	('RS21',	35.00),
	('Jeep',	99.99)
;

INSERT INTO inventarios(tipo_moviento, cantidad, producto_id)
VALUES 
	(1, 30, 1),
	(1, 25, 2),
	(1, 40, 3),
	(1, 50, 5),
	(2, 10, 2),
	(1, 30, 6),
	(2, 10, 5)
;

# Lo ideal seria que no se ingresara la fecha de creacion
# para que se utilice la fecha actual que viene por defecto
INSERT INTO facturas(impuestos, descuentos, total, cliente_id, fecha_creacion)
VALUES 
	(20.50,	35,	1000,	3,	"2019-05-20 00:00:00"),
	(20.50, 25, 800,	1,	"2019-05-25 00:00:00"),
	(16,	15, 400,	8,	"2019-06-10 00:00:00"),
	(20.50, 25, 850,	9,	"2019-06-18 00:00:00"),
	(20.50, 35, 1000,	10,	"2019-06-20 00:00:00"),
	(12,	10, 200,	4,	"2019-06-22 00:00:00"),
	(12,	10, 200,	4,	"2019-06-29 00:00:00"),
	(12,	10, 200,	4,	"2019-07-02 00:00:00")
;

INSERT INTO facturas_productos(cantidad, factura_id, producto_id)
VALUES
	(6,	1,	6),
	(2, 1,	3),
	(3,	1,	5),
	(2, 2,	1),
	(1,	2,	2),
	(1,	3,	2),
	(1,	4,	6),
	(1,	4,	2),
	(2,	4,	1),
	(4,	5,	1),
	(1, 6,	4),
	(2, 6,	5),
	(1, 7,	2),
	(1, 8,	2)
;

# Valores ingresados en las tablas
# Descomentar las lineas de abajo
# SELECT * FROM paises;
# SELECT * FROM productos;
# SELECT * FROM clientes;
# SELECT * FROM inventarios;
# SELECT * FROM facturas;
# SELECT * FROM facturas_productos;