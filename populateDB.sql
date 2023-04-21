USE LBD2023G2;

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

INSERT INTO redSocial (IdRedSocial, Red, LogoLink)
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

INSERT INTO redSocialUsuario (IdRedSocialUsuario, IdUsuario, IdRedSocial, LinkRed)
VALUES (1, 1, 5, 'https://www.ejemplo1.com'),
       (2, 3, 1, 'https://www.ejemplo2.com'),
       (3, 7, 8, 'https://www.ejemplo3.com'),
       (4, 2, 4, 'https://www.ejemplo4.com'),
       (5, 11, 9, 'https://www.ejemplo5.com'),
       (6, 22, 2, 'https://www.ejemplo6.com'),
       (7, 4, 3, 'https://www.ejemplo7.com'),
       (8, 15, 10, 'https://www.ejemplo8.com'),
       (9, 1, 1, 'https://www.ejemplo9.com'),
       (10, 9, 6, 'https://www.ejemplo10.com'),
       (11, 5, 8, 'https://www.ejemplo11.com'),
       (12, 18, 2, 'https://www.ejemplo12.com'),
       (13, 6, 1, 'https://www.ejemplo13.com'),
       (14, 20, 7, 'https://www.ejemplo14.com'),
       (15, 12, 4, 'https://www.ejemplo15.com'),
       (16, 8, 9, 'https://www.ejemplo16.com'),
       (17, 10, 1, 'https://www.ejemplo17.com'),
       (18, 13, 5, 'https://www.ejemplo18.com'),
       (19, 19, 3, 'https://www.ejemplo19.com'),
       (20, 14, 6, 'https://www.ejemplo20.com'),
       (21, 21, 7, 'https://www.ejemplo21.com'),
       (22, 17, 10, 'https://www.ejemplo22.com'),
       (23, 16, 2, 'https://www.ejemplo23.com');


INSERT INTO curriculum (IdCurriculum, IdUsuario, curriculum, Descripcion, Banner, ImagenPerfil, Estado)
VALUES (1, 5, 'Desarrollador Java', 'Lorem ipsum dolor', 'banner1.jpg', 'perfil1.jpg', 'V'),
       (2, 5, 'Medico Anestesista', 'Lorem ipsum dolor', 'banner2.jpg', 'perfil2.jpg', 'V'),
       (3, 15, 'Ingeniero de Sistemas', 'Lorem ipsum dolor', 'banner3.jpg', 'perfil3.jpg', 'V'),
       (4, 10, 'Abogado Penalista', 'Lorem ipsum dolor', 'banner4.jpg', 'perfil4.jpg', 'V'),
       (5, 3, 'Psicóloga Clínica', 'Lorem ipsum dolor', 'banner5.jpg', 'perfil5.jpg', 'V'),
       (6, 17, 'Diseñador Gráfico', 'Lorem ipsum dolor', 'banner6.jpg', 'perfil6.jpg', 'V'),
       (7, 9, 'Contador Público', 'Lorem ipsum dolor', 'banner7.jpg', 'perfil7.jpg', 'V'),
       (8, 6, 'Ingeniero Civil', 'Lorem ipsum dolor', 'banner8.jpg', 'perfil8.jpg', 'V'),
       (9, 6, 'Chef Internacional', 'Lorem ipsum dolor', 'banner9.jpg', 'perfil9.jpg', 'V'),
       (10, 14, 'Médico Internista', 'Lorem ipsum dolor', 'banner10.jpg', 'perfil10.jpg', 'V'),
       (11, 2, 'Ingeniero Mecánico', 'Lorem ipsum dolor', 'banner11.jpg', 'perfil11.jpg', 'V'),
       (12, 12, 'Arquitecto', 'Lorem ipsum dolor', 'banner12.jpg', 'perfil12.jpg', 'V'),
       (13, 20, 'Músico', 'Lorem ipsum dolor', 'banner13.jpg', 'perfil13.jpg', 'V'),
       (14, 18, 'Periodista', 'Lorem ipsum dolor', 'banner14.jpg', 'perfil14.jpg', 'V'),
       (15, 13, 'Economista', 'Lorem ipsum dolor', 'banner15.jpg', 'perfil15.jpg', 'V'),
       (16, 1, 'Desarrollador Web', 'Lorem ipsum dolor', 'banner16.jpg', 'perfil16.jpg', 'V'),
       (17, 10, 'Nutricionista', 'Lorem ipsum dolor', 'banner17.jpg', 'perfil17.jpg', 'V'),
       (18, 4, 'Enfermera', 'Lorem ipsum dolor', 'banner18.jpg', 'perfil18.jpg', 'V'),
       (19, 16, 'Pedagogo', 'Lorem ipsum dolor', 'banner19.jpg', 'perfil19.jpg', 'V'),
       (20, 11, 'Abogado Laboralista', 'Lorem ipsum dolor', 'banner20.jpg', 'perfil20.jpg', 'V'),
       (21, 8, 'Abogado Arborista', 'Lorem ipsum dolor', 'banner20.jpg', 'perfil20.jpg', 'V');

INSERT INTO experiencia (IdExperiencia, Empresa, FechaInicio, FechaFin, Descripcion, Hitos)
VALUES (1, 'Microsoft', '2018-01-01', '2019-12-31', 'Desarrollo de plataforma azure', '[
  "Lanzamiento de la versión 1.0",
  "Más de 1000 usuarios registrados"
]'),
       (2, 'Tinkun', '2019-03-15', '2020-11-30', 'Análisis de datos de usuarios', '[
         "Identificación de patrones de uso",
         "Propuesta de mejoras en la interfaz"
       ]'),
       (3, 'Amazon', '2020-06-01', '2021-09-30', 'Desarrollo de aplicaciones móviles con Flutter', '[
         "Lanzamiento de la versión beta",
         "Más de 500 descargas en una semana"
       ]'),
       (4, 'Hospital Ángel C. Padilla', '2017-11-01', '2019-10-31', 'Residencia de traumatologia', '[
         "Desarrollo de una politica hospitalaria para residentes",
         "Guardias nocturnas"
       ]'),
       (5, 'Hospital del Niño Jesús', '2019-08-01', '2020-07-31', 'Cuidado de pacientes', NULL);


INSERT INTO formacion (IdFormacion, FechaInicio, FechaFin, Institucion, TipoFormacion)
VALUES (1, '2014-08-01', NULL, 'FACULTAD DE DERECHO', 'grado'),
       (2, '2016-01-01', NULL, 'INSTITUCION1', 'curso'),
       (3, '2008-05-01', NULL, 'INSTITUCION2', 'posgrado'),
       (4, '2010-09-01', '2011-12-31', 'INSTITUCION3', 'grado'),
       (5, '2017-01-01', '2017-12-31', 'INSTITUCION4', 'curso');

-- definir forma de detalles
INSERT INTO habilidad (IdHabilidad, TipoHabilidad, Escala, Detalles)
VALUES (1, 'Blanda', 1, NULL),
       (2, 'Dura', 1, '[
         "Django",
         "REST",
         "JSON encoders"
       ]'),
       (3, 'Dura', 2, '[
         "Figma",
         "Invision",
         "HTML"
       ]'),
       (4, 'Blanda', 2, NULL),
       (5, 'Dura', 2, '[
         "Responsive Design"
       ]');


INSERT INTO componente (IdComponente, IdUsuario, TituloComponente, Observacion, IdExperiencia, IdHabilidad, IdFormacion,
                        IdProyecto)
VALUES (1, 4, 'Desarrollador en microsoft', 'Observacion 1', 1, NULL, NULL, NULL),
       (2, 10, 'Ing. Software en Tinkun', NULL, 2, NULL, NULL, NULL),
       (3, 13, 'Programador senior en AWS', 'Observacion 2', 3, NULL, NULL, NULL),
       (4, 5, 'Medico anestesista en hospital padilla', NULL, 4, NULL, NULL, NULL),
       (5, 17, 'Enfermero en hospital de niños', 'Observacion 3', 5, NULL, NULL, NULL),

       (6, 20, 'Bachiller de CS naturales', 'Observacion 4', NULL, 1, NULL, NULL),
       (7, 19, 'Curso de Javascript', NULL, NULL, 2, NULL, NULL),
       (8, 22, 'Curso primeros auxilios', 'Observacion 5', NULL, 3, NULL, NULL),
       (9, 8, 'Congreso de Marketing Digital', 'Observacion 6', NULL, 4, NULL, NULL),
       (10, 3, 'Curso de introduccion de metodologias agiles', 'Observacion 7', NULL, 5, NULL, NULL),

       (11, 6, 'Habilidades en Análisis de Negocios', NULL, NULL, NULL, 1, NULL),
       (12, 1, 'Python', 'Observacion 8', NULL, NULL, 2, NULL),
       (13, 7, 'Diseño de Interfaces de Usuario', NULL, NULL, NULL, 3, NULL),
       (14, 11, 'Programación en Java', 'Observacion 9', NULL, NULL, 4, NULL),
       (15, 15, 'Móbile first', 'Observacion 10', NULL, NULL, 5, NULL);


-- definir forma de recursos
INSERT INTO proyecto (IdProyecto, FechaInicio, FechaFin, Link, Estado, Descripcion, Recursos)
VALUES (1, '2023-04-17', '2023-04-18', 'https://link1.com', 'F', 'Descripción del Proyecto 1', NULL),
       (2, '2023-04-17', '2023-04-18', 'https://link2.com', 'F', 'Descripción del Proyecto 2', NULL),
       (3, '2023-04-17', '2023-04-18', 'https://link3.com', 'F', 'Descripción del Proyecto 3', NULL),
       (4, '2023-04-17', '2023-04-18', 'https://link4.com', 'F', 'Descripción del Proyecto 4', NULL),
       (5, '2023-04-17', '2023-04-18', 'https://link5.com', 'F', 'Descripción del Proyecto 5', NULL),
       (6, '2023-04-17', '2023-04-18', 'https://link6.com', 'F', 'Descripción del Proyecto 6', NULL),
       (7, '2023-04-17', '2023-04-18', 'https://link7.com', 'F', 'Descripción del Proyecto 7', NULL),
       (8, '2023-04-17', '2023-04-18', 'https://link8.com', 'F', 'Descripción del Proyecto 8', NULL),
       (9, '2023-04-17', '2023-04-18', 'https://link9.com', 'F', 'Descripción del Proyecto 9', NULL),
       (10, '2023-04-17', '2023-04-18', 'https://link10.com', 'F', 'Descripción del Proyecto 10', NULL),
       (11, '2023-04-17', '2023-04-18', 'https://link11.com', 'F', 'Descripción del Proyecto 11', NULL),
       (12, '2023-04-17', '2023-04-18', 'https://link12.com', 'F', 'Descripción del Proyecto 12', NULL),
       (13, '2023-04-17', '2023-04-18', 'https://link13.com', 'F', 'Descripción del Proyecto 13', NULL),
       (14, '2023-04-17', '2023-04-18', 'https://link14.com', 'F', 'Descripción del Proyecto 14', NULL),
       (15, '2023-04-17', '2023-04-18', 'https://link15.com', 'F', 'Descripción del Proyecto 15', NULL),
       (16, '2023-04-17', '2023-04-18', 'https://link16.com', 'F', 'Descripción del Proyecto 16', NULL),
       (17, '2023-04-17', '2023-04-18', 'https://link17.com', 'F', 'Descripción del Proyecto 17', NULL),
       (18, '2023-04-17', '2023-04-18', 'https://link18.com', 'F', 'Descripción del Proyecto 18', NULL),
       (19, '2023-04-17', '2023-04-18', 'https://link19.com', 'F', 'Descripción del Proyecto 19', NULL),
       (20, '2023-04-17', '2023-04-18', 'https://link20.com', 'F', 'Descripción del Proyecto 20', NULL);

INSERT INTO componente (IdUsuario, TituloComponente, Observacion, IdProyecto)
VALUES (7, 'Plataforma de Gestión de Proyectos', 'Lorem ipsum dolor', 1),
       (12, 'Sistema de Reservas de Hoteles', 'Sit amet consectetur', 2),
       (3, 'Aplicación de Gestión de Tareas', 'Adipiscing elit sed', 3),
       (5, 'Plataforma de Comercio Electrónico', 'Do eiusmod tempor', 4),
       (14, 'Sistema de Gestión de Contabilidad', 'Incididunt ut labore', 5),
       (2, 'Aplicación de Gestión de Inventarios', 'Et dolore magna', 6),
       (9, 'Plataforma de Gestión de Clientes', 'Aliqua Ut enim', 7),
       (3, 'Sistema de Gestión de Tickets de Soporte', 'Minim veniam quis', 8),
       (11, 'Aplicación de Monitoreo de Redes', 'Nostrud exercitation ullamco', 9),
       (6, 'Plataforma de Gestión de Contenidos', 'Laboris nisi ut', 10),
       (16, 'Sistema de Gestión de Procesos', 'Aliquip ex ea', 11),
       (1, 'Aplicación de Gestión de Proyectos', 'Commodo consequat Duis', 12),
       (15, 'Sistema de Gestión de Ventas en Línea', 'Aute irure dolor', 13),
       (20, 'Plataforma de Gestión de Recursos Humanos', 'Reprehenderit in voluptate', 14),
       (4, 'Sistema de Gestión de Contabilidad en la Nube', 'Velit esse cillum', 15),
       (8, 'Aplicación de Gestión de Proyectos Colaborativos', 'Dolore eu fugiat', 16),
       (19, 'Plataforma de Gestión de Inventario de Tienda en Línea', 'Nulla pariatur Excepteur', 17),
       (10, 'Sistema de Gestión de Proyectos de Investigación', 'Sint occaecat cupidatat', 18),
       (13, 'Aplicación de Gestión de Contenido para Redes Sociales', 'Non proident sunt', 19),
       (5, 'Plataforma de Gestión de Ventas en Línea', 'Officia deserunt mollit', 20);



INSERT INTO componenteCurriculum (IdCurriculum, IdComponente, IdUsuario)
VALUES (5, 10, 3),
       (5, 18, 3),
       (18, 1, 4),
       (1, 4, 5),
       (2, 19, 5),
       (1, 35, 5),
       (21, 31, 8),
       (21, 9, 8),
       (7, 22, 9),
       (6, 5, 17),
       (12, 17, 12),
       (10, 20, 14),
       (20, 14, 11),
       (9, 11, 6),
       (8, 11, 6),   # -
       (3, 15, 15),
       (18, 30, 4),
       (13, 6, 20),
       (13, 29, 20), # -
       (3, 28, 15);


