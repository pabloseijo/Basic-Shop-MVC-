-- Script que añade la información base de los productos a la base de datos

-- Insertamos unos cuantos usuarios
INSERT INTO usuarios (correo, password, numeroTarjeta, tipoTarjeta)
VALUES
('ana.lopez@example.com', 'contrasena123!', '4532763812341234', 'Visa'),
('carlos.juarez@example.net', 'MejorPass2024!', '5500123412341234', 'MasterCard'),
('eva.morales@example.org', 'EvaSegura2024$', '340012345678901', 'American Express'),
('luis.gomez@correo.com', 'Luis123$', '6011123412341234', 'Discover'),
('rita.martinez@example.com', 'RitaPass2024!', '4532987654321234', 'Visa'),
('juan.domingo@example.com', 'Juancho$2024', '6771123412341234', 'Maestro'),
('sara.orozco@ejemplo.com', 'Sara1234', '4532138712345678', 'Visa'),
('david.reyes@correo.net', 'David$2024', '2223003122003222', 'MasterCard'),
('monica.gil@example.org', 'Moni2024!', '370000000000002', 'American Express'),
('pablo.vargas@correo.com', 'Pablo$2024', '6011800000001234', 'Discover');

INSERT INTO productos (nombre, precio, stock, descripcion)
VALUES
('Proteína Whey', 29.99, 50, 'Proteína en polvo de suero para recuperación muscular rápida, sabor chocolate, 1 kg'),
('Leggings de compresión', 35.00, 30, 'Leggings deportivos para maximizar el rendimiento durante el entrenamiento, tamaño mediano'),
('Camiseta técnica', 19.95, 75, 'Camiseta ligera y transpirable para entrenamientos intensos, talla única'),
('Cinta de correr', 899.00, 10, 'Cinta de correr con monitorización de ritmo cardíaco y programas preestablecidos, ideal para cardio en casa'),
('Set de mancuernas ajustables', 199.99, 15, 'Conjunto de mancuernas ajustables de 2 a 24 kg, perfectas para un entrenamiento de fuerza variable'),
('Bicicleta estática', 259.00, 12, 'Bicicleta estática con resistencia ajustable y seguimiento de actividad'),
('Barra olímpica', 120.00, 20, 'Barra olímpica de 20 kg para levantamiento de pesas y entrenamiento de fuerza'),
('Máquina de remo', 420.00, 8, 'Máquina de remo para uso doméstico con resistencia ajustable y seguimiento digital'),
('Gel energético', 1.99, 150, 'Gel energético con cafeína para un impulso rápido durante el ejercicio'),
('Botella de agua deportiva', 9.99, 80, 'Botella de agua de 750 ml con tapa a prueba de fugas, ideal para todos los tipos de entrenamientos');


