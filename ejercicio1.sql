/* ## EJERCICIO 1
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).*/
CREATE TABLE clientes(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	email VARCHAR(255)
)

/* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".*/
INSERT INTO public.clientes(id, nombre, email)
VALUES (1,'Juan', 'juan@example.com')

/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com". */
UPDATE public.clientes
SET email = 'juan@gmail.com'

/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM public.clientes
WHERE id = 1

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).*/
CREATE TABLE pedidos(
	id INT PRIMARY KEY,
	producto VARCHAR(255),
	cantidad INT,
	cliente_id INT,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id)
)

/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.*/
INSERT INTO public.pedidos (id, producto, cantidad, cliente_id)
VALUES (1, 'Camiseta', 2,1)

/* 7. Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE public.pedidos
SET Cantidad = 3 
WHERE id = 1;

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM public.pedidos
WHERE id = 1

/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	precio DECIMAL
)
/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/
INSERT INTO public.productos(id, nombre, precio)
VALUES (1, 'Pantalones', 25.99)

INSERT INTO public.productos(id, nombre, precio)
VALUES (2, 'Bolso', 29.99)

INSERT INTO public.productos(id, nombre, precio)
VALUES (3, 'Sudadera', 49.99)

INSERT INTO public.productos(id, nombre, precio)
VALUES (4, 'Camisa', 39.99)

INSERT INTO public.productos(id, nombre, precio)
VALUES (5, 'Zapatillas', 89.95)

/*11. Consultar todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.clientes

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.*/
SELECT clientes.nombre, pedidos.producto 
FROM clientes 
LEFT JOIN pedidos 
ON clientes.id = pedidos.cliente_id; 

/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $30. */
SELECT * FROM public.productos
WHERE precio > 30

/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.*/
SELECT * FROM public.pedidos
WHERE Cantidad >= 5

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".*/
SELECT * FROM public.clientes
WHERE nombre LIKE 'A%'

/* 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */
SELECT clientes.nombre as nombre, SUM(pedidos.cantidad) as Cantidad
FROM public.clientes
LEFT JOIN public.pedidos
ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nombre
ORDER BY clientes.nombre

/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.*/
SELECT productos.nombre as nombre, SUM(pedidos.cantidad) as Cantidad
FROM public.productos
LEFT JOIN public.pedidos
ON productos.nombre = pedidos.producto
GROUP BY productos.nombre
ORDER BY productos.nombre

/* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE public.pedidos
ADD COLUMN fecha DATE

/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".*/
ALTER TABLE public.pedidos
ADD COLUMN IF NOT EXISTS id_producto INTEGER;

ALTER TABLE public.pedidos
ADD CONSTRAINT fk_product_pedido FOREIGN KEY (id_producto) REFERENCES productos(id)

/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.*/
SELECT clientes.nombre as Nombre, pedidos.producto as Productos, pedidos.cantidad as Cantidad
FROM public.clientes
JOIN public.pedidos
ON clientes.id = pedidos.cliente_id
