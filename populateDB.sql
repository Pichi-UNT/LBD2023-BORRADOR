USE lbd2023g2;

INSERT INTO usuario (IdUsuario, Nombre, Apellido, Correo, Telefono, Cuenta, Pass, Estado)
VALUES (1, 'Juan', 'Pérez', 'juan.perez@example.com', '1234567890', 'juanperez', 'password1', 'A'),
       (2, 'María', 'Gómez', 'maria.gomez@example.com', '9876543210', 'mariagomez', 'password2', 'A'),
       (3, 'Pedro', 'Rodríguez', 'pedro.rodriguez@example.com', '5555555555', 'pedrorodriguez', 'password3', 'A'),
       (4, 'Ana', 'Fernández', 'ana.fernandez@example.com', '1111111111', 'anafernandez', 'password4', 'A'),
       (5, 'Carlos', 'Martínez', 'carlos.martinez@example.com', '7777777777', 'carlosmartinez', 'password5', 'B'),
       (6, 'Laura', 'Sánchez', 'laura.sanchez@example.com', '3333333333', 'laurasanchez', 'password6', 'A'),
       (7, 'Javier', 'López', 'javier.lopez@example.com', '8888888888', 'javierlopez', 'password7', 'A'),
       (8, 'Sofía', 'Ramírez', 'sofia.ramirez@example.com', '4444444444', 'sofiaramirez', 'password8', 'A'),
       (9, 'Miguel', 'Hernández', 'miguel.hernandez@example.com', '9999999999', 'miguelhernandez', 'password9', 'A'),
       (10, 'Paola', 'Ortega', 'paola.ortega@example.com', '6666666666', 'paolaortega', 'password10', 'B'),
       (11, 'Diego', 'Gutiérrez', 'diego.gutierrez@example.com', '1010101010', 'diegogutierrez', 'password11', 'B'),
       (12, 'Marcela', 'Chávez', 'marcela.chavez@example.com', '1212121212', 'marcelachavez', 'password12', 'A'),
       (13, 'Roberto', 'Díaz', 'roberto.diaz@example.com', '1313131313', 'robertodiaz', 'password13', 'A'),
       (14, 'Isabel', 'Jiménez', 'isabel.jimenez@example.com', '1414141414', 'isabeljimenez', 'password14', 'A'),
       (15, 'Fernando', 'Rojas', 'fernando.rojas@example.com', '1515151515', 'fernandorojas', 'password15', 'B'),
       (16, 'Lucía', 'Navarro', 'lucia.navarro@example.com', '1616161616', 'lucianavarro', 'password16', 'A'),
       (17, 'Gustavo', 'García', 'gustavo.garcia@example.com', '1717171717', 'gustavogarcia', 'password17', 'A'),
       (18, 'Alejandra', 'Paredes', 'alejandra.paredes@example.com', '1818181818', 'alejandraparedes', 'password18',
        'A'),
       (19, 'Ricardo', 'Vargas', 'ricardo.vargas@example.com', '1919191919', 'ricardovargas', 'password19', 'A'),
       (20, 'Daniela', 'Castro', 'daniela.castro@example.com', '2020202020', 'danielacastro', 'password20', 'B');

INSERT INTO usuario (Nombre, Apellido, Correo, Telefono, Cuenta, Pass)
VALUES ('Pichi', 'Carrizo', 'pichiz@example.com', '6589898', 'pichino', 'password1');
INSERT INTO usuario (Nombre, Apellido, Correo, Telefono, Cuenta, Pass, Rol)
VALUES ('admin', 'admin', 'admin@example.com', '8989697968', 'admin1234', '11223344', 'A');

SELECT *
FROM usuario;

INSERT INTO componente (IdComponente, IdUsuario, Titulo, Observacion)
VALUES (1, 4, 'Formación en Desarrollo Web', 'Observacion 1'),
       (2, 10, 'Habilidades en Diseño UX/UI', NULL),
       (3, 13, 'Experiencia en Gestión de Proyectos', 'Observacion 2'),
       (4, 5, 'Formación en Programación en Python', NULL),
       (5, 17, 'Habilidades en Análisis de Datos', 'Observacion 3'),
       (6, 20, 'Experiencia en Desarrollo Full Stack', 'Observacion 4'),
       (7, 19, 'Formación en Diseño Gráfico', NULL),
       (8, 22, 'Habilidades en Desarrollo Backend', 'Observacion 5'),
       (9, 8, 'Experiencia en Marketing Digital', 'Observacion 6'),
       (10, 3, 'Formación en Gestión de Proyectos', 'Observacion 7'),
       (11, 6, 'Habilidades en Análisis de Negocios', NULL),
       (12, 1, 'Experiencia en Desarrollo de Aplicaciones Web', 'Observacion 8'),
       (13, 7, 'Formación en Diseño de Interfaces de Usuario', NULL),
       (14, 11, 'Habilidades en Programación en Java', 'Observacion 9'),
       (15, 15, 'Experiencia en Desarrollo de Apps Móviles', 'Observacion 10'),
       (16, 18, 'Formación en Diseño Gráfico', NULL),
       (17, 9, 'Habilidades en Análisis de Datos', 'Observacion 11'),
       (18, 1, 'Experiencia en Desarrollo Frontend', NULL),
       (19, 6, 'Formación en Programación en PHP', 'Observacion 12'),
       (20, 14, 'Habilidades en Gestión del Tiempo', 'Observacion 13');


INSERT INTO componentecurriculum (IdCurriculum, IdUsuario, IdComponente)
VALUES ();

INSERT INTO experiencia (IdComponente, IdUsuario, Empresa, FechaInicio, FechaFin, Descripcion, Hitos)
VALUES ();

INSERT INTO formacion (IdComponente, IdUsuario, FechaInicio, FechaFin, Institucion, TipoFormacion)
VALUES ();

INSERT INTO habilidad (IdComponente, IdUsuario, TipoHabilidad, Escala, Detalles)
VALUES ();

INSERT INTO idioma (Idioma)
VALUES ('ESP'),
       ('ENG'),
       ('FRA'),
       ('GER'),
       ('ITA');

INSERT INTO idiomausuario (IdUsuario, Idioma, Nivel)
VALUES (4, 'ESP', 'Basico'),
       (17, 'ENG', 'Intermedio'),
       (12, 'FRA', 'Avanzado'),
       (8, 'GER', 'Basico'),
       (8, 'ESP', 'Basico'),
       (8, 'ENG', 'Avanzado'),
       (19, 'ITA', 'Intermedio'),
       (2, 'ESP', 'Avanzado'),
       (6, 'ENG', 'Basico'),
       (3, 'FRA', 'Intermedio'),
       (3, 'ESP', 'Basico'),
       (3, 'GER', 'Intermedio'),
       (22, 'GER', 'Avanzado'),
       (11, 'ITA', 'Basico'),
       (11, 'FRA', 'Avanzado'),
       (11, 'ENG', 'Basico'),
       (5, 'ESP', 'Intermedio'),
       (9, 'ENG', 'Avanzado'),
       (7, 'FRA', 'Basico'),
       (13, 'GER', 'Intermedio'),
       (16, 'ITA', 'Avanzado'),
       (20, 'ESP', 'Basico'),
       (10, 'ENG', 'Intermedio'),
       (15, 'FRA', 'Avanzado'),
       (14, 'GER', 'Basico'),
       (1, 'ITA', 'Intermedio');


INSERT INTO proyecto (IdProyecto, IdUsuario, Titulo, FechaInicio, FechaFin, Link, Estado, Descripcion, Recursos)
VALUES ();

INSERT INTO proyectocurriculum (IdCurriculum, IdProyecto)
VALUES ();

INSERT INTO redsocial (IdRedSocial, Red, LogoLink)
VALUES (1, 'Facebook', 'https://www.example.com/facebook_logo.png'),
       (2, 'Twitter', 'https://www.example.com/twitter_logo.png'),
       (3, 'Instagram', 'https://www.example.com/instagram_logo.png'),
       (4, 'LinkedIn', 'https://www.example.com/linkedin_logo.png'),
       (5, 'YouTube', 'https://www.example.com/youtube_logo.png'),
       (6, 'Pinterest', 'https://www.example.com/pinterest_logo.png'),
       (7, 'Snapchat', 'https://www.example.com/snapchat_logo.png'),
       (8, 'TikTok', 'https://www.example.com/tiktok_logo.png'),
       (9, 'Reddit', 'https://www.example.com/reddit_logo.png'),
       (10, 'WhatsApp', 'https://www.example.com/whatsapp_logo.png');

INSERT INTO redsocialusuario (IdRedSocialUsuario, IdUsuario, IdRedSocial, LinkRed)
VALUES ();