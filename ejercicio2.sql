/* Ejercicio 2 */

/* #- Nivel de dificultad: Fácil */

/* # 1. Crea una base de datos llamada "MiBaseDeDatos".*/

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE Usuarios(
	id INT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	edad INT
)
/*3. Inserta dos registros en la tabla "Usuarios".*/

INSERT INTO public.Usuarios(id, nombre, edad)
VALUES (1, 'Elena', 25)

INSERT INTO public.Usuarios(id, nombre, edad)
VALUES (2, 'Sara', 23)

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE public.Usuarios
SET edad = 22
WHERE id = 2

/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM public.Usuarios
WHERE id = 2

/* ## Nivel de dificultad: Moderado

1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/

CREATE TABLE Ciudades(
	id INT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	pais VARCHAR(255) NOT NULL
)

/* 2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO public.Ciudades(id, nombre, pais)
VALUES (1, 'Cracovia', 'Polonia')

INSERT INTO public.Ciudades(id, nombre, pais)
VALUES (2, 'Madrid', 'España')

INSERT INTO public.Ciudades(id, nombre, pais)
VALUES (3, 'Maastricht', 'Holanda')

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/
ALTER TABLE Usuarios
ADD COLUMN ciudad_id INT,
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id) REFERENCES Ciudades(id)

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT Usuarios.nombre as Nombre, Ciudades.nombre as Ciudad, Ciudades.pais as Pais 
FROM public.Usuarios 
LEFT JOIN Ciudades 
ON Usuarios.id = Ciudades.id

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT Usuarios.nombre as Nombre, Ciudades.nombre as Ciudad
FROM public.Usuarios
INNER JOIN Ciudades
ON Usuarios.id = Ciudades.id