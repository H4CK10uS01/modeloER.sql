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

-- Relación Asignatura - Escuela (una asignatura puede darse en varias escuelas)
CREATE TABLE AsignaturaEscuela (
    idAsignatura INT NOT NULL,
    idEscuela INT NOT NULL,
    PRIMARY KEY (idAsignatura, idEscuela),
    FOREIGN KEY (idAsignatura) REFERENCES Asignatura(idAsignatura),
    FOREIGN KEY (idEscuela) REFERENCES Escuela(idEscuela)
);

-- Relación Facilitador - Asignatura (un facilitador imparte una o varias asignaturas)
CREATE TABLE Imparte (
    idFacilitador INT NOT NULL,
    idAsignatura INT NOT NULL,
    PRIMARY KEY (idFacilitador, idAsignatura),
    FOREIGN KEY (idFacilitador) REFERENCES Facilitador(idFacilitador),
    FOREIGN KEY (idAsignatura) REFERENCES Asignatura(idAsignatura)
);

-- =====================================================
-- INSERTS DE PRUEBA (Puedes modificarlos a tu gusto)
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

-- Relación Asignatura – Escuela
INSERT INTO AsignaturaEscuela VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 3);

-- Relación Facilitador – Asignatura
INSERT INTO Imparte VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- =====================================================
-- FIN DEL SCRIPT
-- =====================================================
