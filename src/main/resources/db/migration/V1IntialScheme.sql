-- Script de creacion de la base de datos
-- @autor: David Carpintero y Pablo Seijo
-- @fecha:02/May/2024

-- Creacion de las tablas
-- Creación de las tablas en PostgreSQL

CREATE TABLE usuarios(
                         id SERIAL PRIMARY KEY,
                         correo VARCHAR(50) NOT NULL,
                         password VARCHAR(50) NOT NULL,
                         numeroTarjeta VARCHAR(50) NOT NULL,
                         tipoTarjeta VARCHAR(50) NOT NULL
);

CREATE TABLE productos(
                        id SERIAL PRIMARY KEY,
                        nombre VARCHAR(50) NOT NULL,
                        precio FLOAT NOT NULL,
                        descripcion VARCHAR(150) NOT NULL
);

CREATE TABLE pedidos (
                         id SERIAL PRIMARY KEY,
                         idUsuario INT NOT NULL,
                         fecha DATE NOT NULL,
                         total FLOAT NOT NULL,
                         FOREIGN KEY (idUsuario) REFERENCES usuarios(id)
);




