/* Ejercicio 5 

1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto). */
CREATE TABLE Clientes(
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
)

/* 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".*/
INSERT INTO public.Clientes(id, nombre)
VALUES (1, 'John')

/* 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".*/
UPDATE public.Clientes
SET nombre = 'John Doe'
WHERE id = 1

/* 4. Elimina el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM public.Clientes
WHERE id = 1

 /*5. Lee todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.Clientes
 
 /*6. Crea una tabla llamada "Pedidos2" con las columnas id (entero) y cliente_id (entero).*/
 CREATE TABLE Pedidos2(
  id INT PRIMARY KEY, 
  cliente_id INT
 )
 
 /*7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos2".*/
INSERT INTO public.Pedidos2(id, cliente_id)
VALUES (1,1)
 
 /* 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos2".*/
 UPDATE public.Pedidos2
 SET cliente_id = 2
 WHERE id = 1

/* 9. Elimina el pedido con id=1 de la tabla "Pedidos2".*/
DELETE FROM public.Pedidos2
WHERE id = 1

/* 10. Lee todos los pedidos de la tabla "Pedidos2".*/
SELECT * FROM public.Pedidos2

/* 11. Crea una tabla llamada "Productos2" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE Productos2(
  id INT PRIMARY KEY, 
  nombre VARCHAR(255) NOT NULL
 )

 /* 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/
INSERT INTO public.Productos2(id, nombre)
VALUES (1,'Camisa')
 
/* 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/
 UPDATE public.Productos2
 SET nomre = 'Pantalón'
 WHERE id = 1

/* 14. Elimina el producto con id=1 de la tabla "Productos".*/
DELETE FROM public.Productos2
WHERE id = 1

/* 15. Lee todos los productos de la tabla "Productos".*/
SELECT * FROM public.Productos2

/* 16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).*/
CREATE TABLE DetallesPedido(
  pedido_id INT PRIMARY KEY, 
  producto_id INT
 )

/* 17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".*/
INSERT INTO public.DetallesPedido(pedido_id, producto_id)
VALUES (1,1)

/* 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".*/
UPDATE public.DetallesPedido
SET producto_id = 2
WHERE pedido_id = 1

/* 19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/
DELETE FROM public.DetallesPedido
WHERE pedido_id = 1

 /* 20. Lee todos los detalles de pedido de la tabla "DetallesPedido".*/
INSERT INTO public.DetallesPedido(pedido_id, producto_id)
VALUES (1, 2)

INSERT INTO public.DetallesPedido(pedido_id, producto_id)
VALUES (2, 3)

INSERT INTO public.DetallesPedido(pedido_id, producto_id)
VALUES (3, 5)

INSERT INTO public.DetallesPedido(pedido_id, producto_id)
VALUES (4, 1)

INSERT INTO public.DetallesPedido(pedido_id, producto_id)
VALUES (5, 7)

SELECT * FROM public.DetallesPedido

/* 21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.*/
SELECT Clientes.nombre as Nombre, DetallesPedido.pedido_id as Pedidos
FROM Clientes
INNER JOIN DetallesPedido
ON DetallesPedido.pedido_id = Clientes.id

/* OR (depende de qué tabla nos pidan el dato de pedidos) */

SELECT Clientes.nombre as Nombre, Pedidos.id as Pedidos
FROM Clientes
INNER JOIN Pedidos
ON Pedidos.id = Clientes.id

/*22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join.*/
SELECT Clientes.nombre as Nombre, DetallesPedido.pedido_id as Pedidos
FROM Clientes
LEFT JOIN DetallesPedido
ON DetallesPedido.pedido_id = Clientes.id

/* OR (depende de qué tabla nos pidan el dato de pedidos) */

SELECT Clientes.nombre as Nombre, Pedidos.id as Pedidos
FROM Clientes
LEFT JOIN Pedidos
ON Pedidos.id = Clientes.id

/* Como resultado me aparece un usuario con datos nulos, con códgio INNER JOIN no me aparecía*/

/*23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.*/
SELECT Productos.nombre as Porducto, DetallesPedido.pedido_id as Pedidos
FROM Productos
INNER JOIN DetallesPedido
ON DetallesPedido.pedido_id = Productos.id

/*24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.*/
SELECT Productos.nombre as Porducto, DetallesPedido.pedido_id as Pedidos
FROM Productos
LEFT JOIN DetallesPedido
ON DetallesPedido.pedido_id = Productos.id

/* 25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".*/
ALTER TABLE public.Clientes
ADD COLUMN Telefono VARCHAR(255)

/* 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.*/
ALTER TABLE public.Clientes
ALTER COLUMN Telefono TYPE INT
USING Telefono::integer

/*27. Elimina la columna "telefono" de la tabla "Clientes".*/
ALTER TABLE public.Clientes
DROP COLUMN Telefono

/*28. Cambia el nombre de la tabla "Clientes" a "Usuarios2".*/
ALTER TABLE public.Clientes
RENAME TO Usuarios2

/* 29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios2" a "nombre_completo".*/
ALTER TABLE public.Usuarios2
RENAME COLUMN nombre TO nombre_completo

/*30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/
ALTER TABLE public.Usuarios2
ADD PRIMARY KEY (id)
