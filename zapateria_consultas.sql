# Facturación de un cliente especifico
SELECT
	c.dni,
	CONCAT(c.apellido, ' ', c.nombre) AS nombre_completo,
	ps.nombre AS pais,
	f.id AS codigo_factura,
	p.nombre,
	fp.cantidad 
FROM clientes c
	LEFT JOIN facturas f
	ON f.cliente_id = c.id
	LEFT JOIN paises ps
	ON c.pais_id = ps.id
	LEFT JOIN facturas_productos fp
	ON fp.factura_id = f.id
	LEFT JOIN productos p
	ON fp.producto_id = p.id
WHERE c.id = 4
ORDER BY f.id
;

# Facturacion de un producto especifico
SELECT 
	f.id AS codigo_factura,
	p.nombre,
	p.valor,
	fp.cantidad,
	CONCAT(c.apellido, ' ', c.nombre) AS cliente,
	f.fecha_creacion AS fecha_compra
FROM productos p
	LEFT JOIN facturas_productos fp
	ON p.id = fp.producto_id
	LEFT JOIN facturas f
	ON fp.factura_id = f.id
	LEFT JOIN clientes c
	ON f.cliente_id = c.id
WHERE p.id = 6
ORDER BY f.id
;

# Facturación de un rango de fechas.
SELECT 
	f.id AS codigo_factura,
	p.nombre,
	p.valor,
	fp.cantidad,
	CONCAT(c.apellido, ' ', c.nombre) AS cliente,
	f.fecha_creacion AS fecha_compra
FROM productos p
	LEFT JOIN facturas_productos fp
	ON p.id = fp.producto_id
	LEFT JOIN facturas f
	ON fp.factura_id = f.id
	LEFT JOIN clientes c
	ON f.cliente_id = c.id
WHERE f.fecha_creacion BETWEEN '2019-05-15 00:00:00' AND '2019-06-15 00:00:00'
ORDER BY f.id
;

# Optencion de clientes que han realizado almenos una compra
SELECT
	DISTINCT c.dni,
	CONCAT(c.apellido, ' ', c.nombre) AS nombre_completo,
	ps.nombre AS pais,
	COUNT(f.id) AS compras
FROM clientes c
	INNER JOIN facturas f
	ON f.cliente_id = c.id
	LEFT JOIN paises ps
	ON c.pais_id = ps.id
GROUP BY c.id
ORDER BY ps.nombre
;