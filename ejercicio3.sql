/* Ejercicio 3

#- Nivel de dificultad: Díficil

1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/

CREATE TABLE Productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	precio DECIMAL
)

/*2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO public.productos(id, nombre, precio)
VALUES (1, 'Yogurt', 2.99)

INSERT INTO public.productos(id, nombre, precio)
VALUES (2, 'Fresas', 4.99)

INSERT INTO public.productos(id, nombre, precio)
VALUES (3, 'Cereales', 3.95)

INSERT INTO public.productos(id, nombre, precio)
VALUES (4, 'Chocolate', 1.95)

INSERT INTO public.productos(id, nombre, precio)
VALUES (5, 'Kiwi', 0.95)

/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE public.productos
SET precio = 2.95
WHERE id = 1

/* 4. Elimina un producto de la tabla "Productos".*/
DELETE FROM public.productos
WHERE id = 5

/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/

SELECT Usuarios.nombre as Nombre, Productos.nombre as Producto
FROM public.Usuarios
INNER JOIN public.Productos
ON Productos.id = Usuarios.id

