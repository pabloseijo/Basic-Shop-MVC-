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

-- Insertamos unos cuantos productos
INSERT INTO productos (nombre, precio, stock, descripcion)
VALUES
('Abbey Road - The Beatles', 19.99, 25, 'Vinilo del álbum clásico de The Beatles, lanzado en 1969. Incluye éxitos como "Come Together" y "Something".'),
('Back in Black - AC/DC', 17.99, 20, 'Vinilo del álbum emblemático de AC/DC, lanzado en 1980. Contiene la famosa canción "Back in Black".'),
('Thriller - Michael Jackson', 22.99, 30, 'Vinilo del álbum más vendido de todos los tiempos de Michael Jackson, lanzado en 1982. Incluye el éxito "Billie Jean".'),
('The Dark Side of the Moon - Pink Floyd', 21.99, 15, 'Vinilo del álbum icónico de Pink Floyd, lanzado en 1973. Contiene clásicos como "Time" y "Money".'),
('Rumours - Fleetwood Mac', 18.99, 18, 'Vinilo del álbum superventas de Fleetwood Mac, lanzado en 1977. Incluye canciones como "Dreams" y "Go Your Own Way".'),
('The Joshua Tree - U2', 16.99, 12, 'Vinilo del álbum aclamado de U2, lanzado en 1987. Incluye éxitos como "With or Without You" y "I Still Haven\'t Found What I\'m Looking For".'),
('Hotel California - Eagles', 19.49, 10, 'Vinilo del álbum clásico de Eagles, lanzado en 1976. Contiene la famosa canción "Hotel California".'),
('Born to Run - Bruce Springsteen', 20.49, 15, 'Vinilo del álbum icónico de Bruce Springsteen, lanzado en 1975. Incluye la canción "Born to Run".'),
('21 - Adele', 15.99, 20, 'Vinilo del álbum superventas de Adele, lanzado en 2011. Contiene éxitos como "Rolling in the Deep" y "Someone Like You".'),
('Greatest Hits - Queen', 22.49, 25, 'Vinilo del álbum de grandes éxitos de Queen, lanzado en 1981. Incluye canciones icónicas como "Bohemian Rhapsody" y "Another One Bites the Dust".');

