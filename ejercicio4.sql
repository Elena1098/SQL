/* Ejercicio 4 
# Nivel de dificultad: Experto 

1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos"). */
CREATE TABLE Pedidos(
	id INT PRIMARY KEY,
  id_usuario INT,
  id_producto INT,
  CONSTRAINT Fk_Usuarios FOREIGN KEY (id_usuario) REFERENCES public.Usuarios(id),
  CONSTRAINT FK_Productos FOREIGN KEY (id_producto) REFERENCES public.Productos(id)
)

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. */

INSERT INTO public.Pedidos(id, id_usuario, id_producto)
VALUES (1, 2, 2)

INSERT INTO public.Pedidos(id, id_usuario, id_producto)
VALUES (2, 1, 1)

INSERT INTO public.Pedidos(id, id_usuario, id_producto)
VALUES (3, 3, 3)

/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).*/

SELECT Usuarios.nombre as Nombre, Productos.nombre as Producto, Pedidos.id as Pedidos
FROM public.Usuarios
LEFT JOIN Pedidos ON public.Usuarios.id = id_usuario
LEFT JOIN Productos ON public.Productos.id = id_producto
WHERE COALESCE (Pedidos.id,0) = 0
OR Pedidos.id IS NOT NULL
ORDER BY Usuarios.id ASC

 /* 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN). */
SELECT Usuarios.nombre as Nombre, Pedidos.id as Pedidos
FROM public.Usuarios
LEFT JOIN Pedidos ON public.Usuarios.id = id_usuario
 
 /*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE public.Pedidos 
ADD COLUMN Cantidad INT

UPDATE public.Pedidos
SET Cantidad = 3
where id = 1

UPDATE public.Pedidos
SET Cantidad = 5
where id = 2

UPDATE public.Pedidos
SET Cantidad = 1
where id = 3