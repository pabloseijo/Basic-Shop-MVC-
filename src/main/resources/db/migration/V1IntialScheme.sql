-- Script de creacion de la base de datos
-- @autor: David Carpintero y Pablo Seijo
-- @fecha:02/May/2024

-- Creacion de la base de datos
CREATE DATABASE IF NOT EXISTS Minitienda;

-- Conexion a la base de datos
USE Minitienda;

-- Creacion de las tablas
CREATE TABLE usuarios(
    id int auto_increment primary key,
    correo varchar(50) not null,
    password varchar(50) not null,
    numeroTarjeta varchar(50) not null,
    tipoTarjeta varchar(50) not null,
);

CREATE TABLE productos(
    id int auto_increment primary key,
    nombre varchar(50) not null,
    precio float not null,
    stock int not null,
    descripcion varchar(50) not null,
);

CREATE TABLE pedidos (
    id int auto_increment primary key,
    idUsuario int not null,
    idProducto int not null,
    fecha date not null,
    total float not null,
    foreign key (idUsuario) references usuarios(id),
    foreign key (idProducto) references productos(id)
);



