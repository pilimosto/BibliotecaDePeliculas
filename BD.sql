CREATE DATABASE BibliotecaPeliculas;

USE BibliotecaPeliculas;

CREATE TABLE Peliculas(
	id_pelicula INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    director VARCHAR(80) NULL,
    fecha_estreno DATE NULL,
    genero VARCHAR(50) NULL,
    duracion INT NULL,
    sinopsis TEXT NULL,
    estado BOOLEAN NOT NULL
);

