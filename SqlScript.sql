CREATE DATABASE IF NOT EXISTS biblioteca_peliculas;
-- DROP DATABASE biblioteca_peliculas;
USE biblioteca_peliculas;

CREATE TABLE IF NOT EXISTS Genero (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Pelicula (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL UNIQUE,
    Descripcion TEXT,
    FechaPublicacion DATE NOT NULL,
    RutaPortada VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS GenerosPorPelicula (
    IdPelicula INT NOT NULL,
    IdGenero INT NOT NULL,
	PRIMARY KEY (IdPelicula, IdGenero),
    FOREIGN KEY (IdPelicula) REFERENCES Pelicula(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdGenero) REFERENCES Genero(Id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Usuario (
    NombreUsuario VARCHAR(256) PRIMARY KEY,
    Email VARCHAR(256) NULL UNIQUE,
    Clave TEXT NOT NULL,
    NombreCompleto VARCHAR(100) NULL,
    FechaNacimiento DATE NULL,
    Rol BIT 
);

CREATE TABLE IF NOT EXISTS GenerosPorUsuario (
    IdUsuario VARCHAR(256),
    IdGenero INT NOT NULL,
    PRIMARY KEY (IdUsuario, IdGenero),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(NombreUsuario) ON DELETE CASCADE,
    FOREIGN KEY (IdGenero) REFERENCES Genero(Id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Valoraciones (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Puntuacion INT NOT NULL CHECK (Puntuacion BETWEEN 1 AND 5),
    Comentario TEXT NULL,
    FechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    IdUsuario VARCHAR(255) NOT NULL,
    IdPelicula INT NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(NombreUsuario) ON DELETE CASCADE,
    FOREIGN KEY (IdPelicula) REFERENCES Pelicula(Id) ON DELETE CASCADE
);


INSERT INTO Genero (Id, Nombre) VALUES 
(1, 'Comedia'), 
(2, 'Romance'), 
(3, 'Acción'),
(4, 'Ciencia Ficción'),
(5, 'Fantasía');

INSERT INTO Pelicula (Titulo, Descripcion, FechaPublicacion) VALUES 
('Cuando Harry conoció a Sally', 'Una comedia romántica clásica', '1989-07-21'),
('Matrix', 'Un hacker descubre la verdad sobre la realidad', '1999-03-31'),
('Jurassic Park', 'Dinosaurios cobran vida', '1993-06-11'),
('Amélie', 'Una joven cambia vidas en París', '2001-04-25');

INSERT INTO GenerosPorPelicula (IdPelicula, IdGenero) VALUES 
(1, 1), 
(1, 2), 
(2, 3), 
(2, 4),
(3, 3), 
(3, 4), 
(4, 2), 
(4, 5); 