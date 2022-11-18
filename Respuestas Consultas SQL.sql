--EJERCICIO 1
SELECT p.nombre
FROM producto p
JOIN rubro r
ON p.id_rubro = r.id_rubro
WHERE r.rubro = 'librería'
AND p.fecha_creacion = CAST( GETDATE() AS Date ); 

--EJERCICIO 2
SELECT c.nombre, SUM(v.precio_unitario * v.cantidad)
FROM cliente c
JOIN venta v
ON c.id_cliente = v.id_cliente
GROUP BY c.nombre;

--EJERCICIO 3
SELECT p.nombre, COUNT(*)
FROM venta v
JOIN producto p
ON v.codigo_producto = p.codigo
GROUP BY p.nombre;

--EJERCICIO 4
SELECT c.nombre, SUM(v.cantidad)
FROM cliente c
JOIN venta v
ON c.id_cliente = v.id_cliente
WHERE MONTH(p.fecha) = MONTH(GETDATE());
GROUP BY c.nombre;

--EJERCICIO 5
SELECT vv.*
FROM venta vv
WHERE EXISTS(
	SELECT 1
	FROM venta v
	JOIN producto p
	ON v.codigo_producto = p.codigo
	JOIN rubro r
	ON p.id_rubro = r.id_rubro
	wHERE r.rubro = 'bazar'
	AND v.id_venta = vv.id_venta);

--EJERCICIO 6
SELECT rr.*
FROM rubro rr
WHERE NOT EXISTS(
	SELECT 1
	FROM venta v
	JOIN producto p
	ON v.codigo_producto = p.codigo
	JOIN rubro r
	ON p.id_rubro = r.id_rubro
	wHERE MONTH(v.fecha) = MONTH(GETDATE()) 
	OR MONTH(v.fecha) = MONTH(GETDATE()-1)
	AND r.id_rubro = rr.id_rubro);
