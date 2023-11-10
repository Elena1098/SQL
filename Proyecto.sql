CREATE TABLE Alumnos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(25),
	apellido VARCHAR(25)
);

CREATE TABLE Cursos(
	id SERIAL PRIMARY KEY,
	nombre_curso VARCHAR(25),
	duracion_semanas INT,
	fecha_inicio DATE
);

CREATE TABLE Inscripciones(
	id SERIAL PRIMARY KEY,
	id_alumno INTEGER REFERENCES Alumnos(id),
	id_curso INTEGER REFERENCES Cursos(id)
);

CREATE TABLE Participaciones(
	id SERIAL PRIMARY KEY,
	id_alumno INTEGER REFERENCES Alumnos(id),
	id_curso INTEGER REFERENCES Cursos(id),
	tipo VARCHAR(10) CHECK (tipo IN('Foro', 'Clase', 'Tareas')),
	fecha DATE
);

ALTER TABLE Inscripciones
ADD COLUMN fecha DATE;


INSERT INTO Alumnos(nombre, apellido) VALUES
('Juan', 'Perez'), 
('Maria', 'Gonzalez');

INSERT INTO Cursos(nombre_curso, duracion_semanas,fecha_inicio) VALUES
('Python', 12, '2023-01-20'),
('SQL', 8, '2023-01-22');

INSERT INTO Inscripciones(id_alumno, id_curso, fecha) VALUES
(1,1,'2023-01-20'),
(2,1,'2023-01-22');

INSERT INTO Participaciones(id_alumno, id_curso, tipo, fecha) VALUES
(1,1,'Foro','2023-01-21'),
(2,1,'Clase','2023-01-25');

SELECT Alumnos.nombre, Alumnos.apellido, inscripciones.fecha as fecha_inicio, participaciones.tipo, participaciones.fecha as fecha_participacion, cursos.nombre_curso
FROM Alumnos
INNER JOIN Inscripciones ON alumnos.id = inscripciones.id_alumno
INNER JOIN Participaciones ON alumnos.id = participaciones.id_alumno
INNER JOIN Cursos ON cursos.id = participaciones.id_alumno;