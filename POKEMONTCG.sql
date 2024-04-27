CREATE DATABASE PokemonTcg;

USE PokemonTcg;

-- Tabla Usuario
CREATE TABLE Usuario (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    CorreoElectronico VARCHAR(100) UNIQUE,
    Contraseña VARCHAR(100)
);

-- Tabla Baraja
CREATE TABLE Baraja (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Usuario_ID INT,
    Puntuacion INT,
    FOREIGN KEY (Usuario_ID) REFERENCES Usuario(ID)
);

-- Tabla Carta
CREATE TABLE Carta (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Tipo ENUM('pokemon', 'entrenador', 'energia'),
    Rareza VARCHAR(50),
    Poder INT,
    Conjunto VARCHAR(100),
    Valor DECIMAL(10,2)
);

-- Tabla Partida
CREATE TABLE Partida (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE,
    Duracion TIME,
    Ganador INT,
    Jugador1_ID INT,
    Jugador2_ID INT,
    FOREIGN KEY (Ganador) REFERENCES Usuario(ID),
    FOREIGN KEY (Jugador1_ID) REFERENCES Usuario(ID),
    FOREIGN KEY (Jugador2_ID) REFERENCES Usuario(ID)
);

-- Insertar datos iniciales en la tabla Usuario
INSERT INTO Usuario (Nombre, CorreoElectronico, Contraseña)
VALUES 
    ('Usuario1', 'usuario1@example.com', 'contraseña1'),
    ('Usuario2', 'usuario2@example.com', 'contraseña2'),
    ('Usuario3', 'usuario3@example.com', 'contraseña3'),
    ('Usuario4', 'usuario4@example.com', 'contraseña4'),
    ('Usuario5', 'usuario5@example.com', 'contraseña5'),
    ('Usuario6', 'usuario6@example.com', 'contraseña6'),
    ('Usuario7', 'usuario7@example.com', 'contraseña7'),
    ('Usuario8', 'usuario8@example.com', 'contraseña8'),
    ('Usuario9', 'usuario9@example.com', 'contraseña9'),
    ('Usuario10', 'usuario10@example.com', 'contraseña10');

-- Insertar datos iniciales en la tabla Baraja
INSERT INTO Baraja (Nombre, Usuario_ID, Puntuacion)
VALUES 
    ('Baraja1', 1, 1500),
    ('Baraja2', 1, 1600),
    ('Baraja3', 2, 1550),
    ('Baraja4', 2, 1550),
    ('Baraja5', 3, 1600),
    ('Baraja6', 3, 1450),
    ('Baraja7', 4, 1520),
    ('Baraja8', 4, 1700),
    ('Baraja9', 5, 1580),
    ('Baraja10', 6, 1490),
    ('Baraja11', 7, 1650);

-- Insertar datos iniciales en la tabla Carta
INSERT INTO Carta (Nombre, Tipo, Rareza, Poder, Conjunto, Valor)
VALUES 
    ('Pikachu', 'pokemon', 'Común', 50, 'Base Set', 10.50),
    ('Charizard', 'pokemon', 'Raro', 150, 'Base Set', 100.00),
    ('Professor Oak', 'entrenador', 'Raro', NULL, 'Base Set', 5.00),
    ('Bulbasaur', 'pokemon', 'Común', 40, 'Base Set', 8.75),
    ('Squirtle', 'pokemon', 'Común', 30, 'Base Set', 7.50),
    ('Charmander', 'pokemon', 'Común', 30, 'Base Set', 7.25),
    ('Energy Retrieval', 'entrenador', 'Común', NULL, 'Base Set', 3.00),
    ('Switch', 'entrenador', 'Común', NULL, 'Base Set', 2.50),
    ('Grass Energy', 'energia', 'Común', NULL, 'Base Set', 1.25),
    ('Water Energy', 'energia', 'Común', NULL, 'Base Set', 1.25),
    ('Fire Energy', 'energia', 'Común', NULL, 'Base Set', 1.25);

-- Insertar datos iniciales en la tabla Partida
INSERT INTO Partida (Fecha, Duracion, Ganador, Jugador1_ID, Jugador2_ID)
VALUES 
    ('2024-04-18', '00:45:00', 1, 1, 2),
    ('2024-04-19', '01:15:00', 2, 1, 2),
    ('2024-04-20', '00:40:00', 1, 1, 3),
    ('2024-04-21', '01:20:00', 3, 2, 3),
    ('2024-04-22', '00:50:00', 4, 4, 5),
    ('2024-04-23', '01:10:00', 5, 5, 6),
    ('2024-04-24', '00:55:00', 6, 7, 8),
    ('2024-04-25', '01:30:00', 7, 9, 10),
    ('2024-04-26', '00:35:00', 9, 9, 8),
    ('2024-04-27', '01:05:00', 10, 10, 7);
