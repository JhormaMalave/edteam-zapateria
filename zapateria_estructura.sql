# Preparacion de la base de datos

DROP DATABASE IF EXISTS zapato_roto;
CREATE DATABASE zapato_roto;
USE zapato_roto;

# Estructura de las tablas:
# 1. Atributos
# 2. Atributos foraneos (opcional)
# 3. Definicion de 
#		Llaves primarias
#		Campos unicos
#		Llaves foraneas


CREATE TABLE paises(
	id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(60),

	CONSTRAINT UNIQUE(nombre),
	PRIMARY KEY(id)
);

CREATE TABLE productos(
	id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	valor DOUBLE UNSIGNED NOT NULL,


	PRIMARY KEY(id),
	CONSTRAINT UNIQUE(nombre)
);

CREATE TABLE clientes(
	id INT UNSIGNED AUTO_INCREMENT,
	dni INT UNSIGNED NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,

	pais_id INT UNSIGNED NOT NULL,

	PRIMARY KEY(id),
	CONSTRAINT UNIQUE(dni),
	FOREIGN KEY(pais_id) REFERENCES paises(id)
);

CREATE TABLE inventarios(
	id INT UNSIGNED AUTO_INCREMENT,
	tipo_moviento ENUM('Entrada', 'Salida') NOT NULL,
	cantidad INT UNSIGNED NOT NULL,

	producto_id INT UNSIGNED NOT NULL,

	PRIMARY KEY(id),
	FOREIGN KEY(producto_id) REFERENCES productos(id)
);

CREATE TABLE facturas(
	id INT UNSIGNED AUTO_INCREMENT,
	impuestos DOUBLE UNSIGNED NOT NULL,
	descuentos DOUBLE UNSIGNED NOT NULL,
	total DOUBLE UNSIGNED NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

	cliente_id INT UNSIGNED NOT NULL,

	PRIMARY KEY(id),
	FOREIGN KEY(cliente_id) REFERENCES clientes(id)
);

# Relacion muchos a muchos entre las facturas y los productos
CREATE TABLE facturas_productos(
	id INT UNSIGNED AUTO_INCREMENT,
	cantidad INT UNSIGNED NOT NULL,

	factura_id INT UNSIGNED NOT NULL,
	producto_id INT UNSIGNED NOT NULL,

	PRIMARY KEY(id),
	CONSTRAINT factura_producto UNIQUE(factura_id, producto_id),
	FOREIGN KEY(factura_id) REFERENCES facturas(id),
	FOREIGN KEY(producto_id) REFERENCES productos(id)
);


# Descripcion de las tablas
# Descomentar las lineas de abajo
# DESC paises;
# DESC productos;
# DESC clientes;
# DESC inventarios;
# DESC facturas;
# DESC facturas_productos;