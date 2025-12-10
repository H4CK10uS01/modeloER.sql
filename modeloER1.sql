-- =====================================================
-- CREACIÓN DE BASE DE DATOS
-- =====================================================
CREATE DATABASE IF NOT EXISTS universidad;
USE universidad;

-- =====================================================
-- TABLAS PRINCIPALES
-- =====================================================

-- 1. Departamento
CREATE TABLE Departamento (
    idDepartamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 2. Área de conocimiento
CREATE TABLE AreaConocimiento (
    idArea INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idDepartamento INT NOT NULL,
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)
);

-- 3. Escuela
CREATE TABLE Escuela (
    idEscuela INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 4. Asignatura
CREATE TABLE Asignatura (
    idAsignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idArea INT NOT NULL,
    FOREIGN KEY (idArea) REFERENCES AreaConocimiento(idArea)
);

-- 5. Facilitador
CREATE TABLE Facilitador (
    idFacilitador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idArea INT NOT NULL,
    FOREIGN KEY (idArea) REFERENCES AreaConocimiento(idArea)
);

-- =====================================================
-- TABLAS DE RELACIÓN (N a N)
-- =====================================================

CREATE TABLE AsignaturaEscuela (
    idAsignatura INT NOT NULL,
    idEscuela INT NOT NULL,
    PRIMARY KEY (idAsignatura, idEscuela),
    FOREIGN KEY (idAsignatura) REFERENCES Asignatura(idAsignatura),
    FOREIGN KEY (idEscuela) REFERENCES Escuela(idEscuela)
);

CREATE TABLE Imparte (
    idFacilitador INT NOT NULL,
    idAsignatura INT NOT NULL,
    PRIMARY KEY (idFacilitador, idAsignatura),
    FOREIGN KEY (idFacilitador) REFERENCES Facilitador(idFacilitador),
    FOREIGN KEY (idAsignatura) REFERENCES Asignatura(idAsignatura)
);

-- =====================================================
-- INSERTS DE PRUEBA (LOS ORIGINALES)
-- =====================================================

INSERT INTO Departamento (nombre) VALUES
('Ciencias y Tecnología'),
('Ciencias Sociales');

INSERT INTO AreaConocimiento (nombre, idDepartamento) VALUES
('Informática', 1),
('Redes y Telecomunicaciones', 1),
('Educación', 2);

INSERT INTO Escuela (nombre) VALUES
('Escuela de Ingeniería'),
('Escuela de Negocios'),
('Escuela de Educación');

INSERT INTO Asignatura (nombre, idArea) VALUES
('Base de Datos', 1),
('Programación I', 1),
('Redes I', 2),
('Didáctica General', 3);

INSERT INTO Facilitador (nombre, idArea) VALUES
('Ana Torres', 1),
('Luis Martínez', 2),
('Carolina Peña', 3);

INSERT INTO AsignaturaEscuela VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 3);

INSERT INTO Imparte VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- =====================================================
-- SECCIÓN ABCC PARA LA ACTIVIDAD
-- =====================================================

-- ======================
-- ALTAS (20)
-- ======================

INSERT INTO Departamento (nombre) VALUES ('Artes Digitales');
INSERT INTO Departamento (nombre) VALUES ('Salud');

INSERT INTO AreaConocimiento (nombre, idDepartamento)
VALUES ('Ciberseguridad', 1);

INSERT INTO AreaConocimiento (nombre, idDepartamento)
VALUES ('Ingeniería Biomédica', 4);

INSERT INTO Escuela (nombre) VALUES ('Escuela de Arquitectura');
INSERT INTO Escuela (nombre) VALUES ('Escuela de Salud');

INSERT INTO Asignatura (nombre, idArea)
VALUES ('Fundamentos de Ciberseguridad', 4);

INSERT INTO Asignatura (nombre, idArea)
VALUES ('Ética en TI', 1);

INSERT INTO Asignatura (nombre, idArea)
VALUES ('Arquitectura del Computador', 1);

INSERT INTO Facilitador (nombre, idArea)
VALUES ('Marcos Herrera', 4);

INSERT INTO Facilitador (nombre, idArea)
VALUES ('Raquel Soto', 1);

INSERT INTO Facilitador (nombre, idArea)
VALUES ('Pedro Lozano', 2);

INSERT INTO AsignaturaEscuela VALUES (5, 4);
INSERT INTO AsignaturaEscuela VALUES (6, 5);

INSERT INTO Imparte VALUES (4, 5);
INSERT INTO Imparte VALUES (5, 6);

INSERT INTO Asignatura (nombre, idArea)
VALUES ('Seguridad en Redes', 2);

INSERT INTO AreaConocimiento (nombre, idDepartamento)
VALUES ('Análisis de Datos', 1);

INSERT INTO Escuela (nombre)
VALUES ('Escuela de Innovación');

INSERT INTO Imparte VALUES (6, 7);

-- ======================
-- BAJAS (2)
-- ======================

DELETE FROM AreaConocimiento WHERE idArea = 3;
DELETE FROM Escuela WHERE idEscuela = 5;

-- ======================
-- CAMBIOS (5)
-- ======================

UPDATE Departamento
SET nombre = 'Ciencias y Tecnología Aplicada'
WHERE idDepartamento = 1;

UPDATE Asignatura
SET nombre = 'Programación Estructurada'
WHERE idAsignatura = 2;

UPDATE Facilitador
SET nombre = 'Ana Torres Ramírez'
WHERE idFacilitador = 1;

UPDATE Escuela
SET nombre = 'Escuela Global de Ingeniería'
WHERE idEscuela = 1;

UPDATE Asignatura
SET idArea = 4
WHERE idAsignatura = 1;

-- ======================
-- CONSULTAS (5)
-- ======================

SELECT * FROM Asignatura;

SELECT nombre, idArea
FROM Facilitador;

SELECT A.nombre AS Asignatura, E.nombre AS Escuela
FROM AsignaturaEscuela AE
JOIN Asignatura A ON AE.idAsignatura = A.idAsignatura
JOIN Escuela E ON AE.idEscuela = E.idEscuela;

SELECT AC.nombre AS Area, D.nombre AS Departamento
FROM AreaConocimiento AC
JOIN Departamento D ON AC.idDepartamento = D.idDepartamento;

SELECT F.nombre AS Facilitador, A.nombre AS Asignatura
FROM Imparte I
JOIN Facilitador F ON I.idFacilitador = F.idFacilitador
JOIN Asignatura A ON I.idAsignatura = A.idAsignatura;
