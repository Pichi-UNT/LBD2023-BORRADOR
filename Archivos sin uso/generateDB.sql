CREATE SCHEMA IF NOT EXISTS LBD2023G2;
USE LBD2023G2;

# DELETE FROM componenteCurriculum ;
# DELETE FROM componente;
# DELETE FROM formacion;
# DELETE FROM habilidad;
# DELETE FROM experiencia;
# DELETE FROM proyecto;
# DELETE FROM curriculum;
# DELETE FROM redSocialUsuario;
# DELETE FROM redSocial;
# DELETE FROM usuario;

-- Eliminar tablas en el orden correcto para evitar conflictos de clave foránea
DROP TABLE IF EXISTS componenteCurriculum;
DROP TABLE IF EXISTS componente;
DROP TABLE IF EXISTS formacion;
DROP TABLE IF EXISTS habilidad;
DROP TABLE IF EXISTS experiencia;
DROP TABLE IF EXISTS proyectoCurriculum;
DROP TABLE IF EXISTS proyecto;
DROP TABLE IF EXISTS curriculum;
DROP TABLE IF EXISTS redSocialUsuario;
DROP TABLE IF EXISTS redSocial;
DROP TABLE IF EXISTS usuario;
--
-- TABLE: experiencia
--

CREATE TABLE experiencia
(
    IdExperiencia INT AUTO_INCREMENT,
    Empresa       VARCHAR(100) NOT NULL,
    FechaInicio   DATE         NOT NULL,
    FechaFin      DATE,
    Descripcion   TEXT,
    Hitos         JSON,
    PRIMARY KEY (IdExperiencia)
) ENGINE = INNODB
;



--
-- TABLE: habilidad
--

CREATE TABLE habilidad
(
    IdHabilidad   INT AUTO_INCREMENT,
    TipoHabilidad ENUM ('Dura','Blanda','Idioma') NOT NULL,
    Escala        TINYINT                         NOT NULL,
    Detalles      JSON,
    PRIMARY KEY (IdHabilidad),
    CHECK (Escala > 0),
    CHECK (Escala <= 5)
) ENGINE = INNODB
;



--
-- TABLE: formacion
--

CREATE TABLE formacion
(
    IdFormacion   INT AUTO_INCREMENT,
    FechaInicio   DATE                                              NOT NULL,
    FechaFin      DATE,
    Institucion   VARCHAR(100)                                      NOT NULL,
    TipoFormacion ENUM ('secundaria', 'curso', 'grado', 'posgrado') NOT NULL,
    PRIMARY KEY (IdFormacion)
) ENGINE = INNODB
;



--
-- TABLE: usuario
--

CREATE TABLE usuario
(
    IdUsuario INT         AUTO_INCREMENT,
    Nombre    VARCHAR(120) NOT NULL,
    Apellido  VARCHAR(120) NOT NULL,
    Correo    VARCHAR(256) NOT NULL,
    Telefono  VARCHAR(15),
    Cuenta    VARCHAR(40)  NOT NULL,
    Pass      CHAR(60)     NOT NULL,
    Estado    CHAR(1)      NOT NULL DEFAULT 'A',
    Rol       CHAR(1)      NOT NULL DEFAULT 'U',
    PRIMARY KEY (IdUsuario),
    INDEX IX_ApellidoNombre (Apellido, Nombre),
    UNIQUE INDEX UX_Cuenta (Cuenta)
) ENGINE = INNODB
;



--
-- TABLE: proyecto
--

CREATE TABLE proyecto
(
    IdProyecto  INT AUTO_INCREMENT,
    FechaInicio DATE         NOT NULL,
    FechaFin    DATE,
    Link        VARCHAR(120),
    Estado      CHAR(1)      NOT NULL,
    Descripcion TEXT,
    Recursos    JSON        ,
    PRIMARY KEY (IdProyecto)
) ENGINE = INNODB
;



--
-- TABLE: componente
--

CREATE TABLE componente(
    IdComponente     INT             AUTO_INCREMENT,
    IdUsuario        INT             NOT NULL,
    TituloComponente           VARCHAR(150)    NOT NULL,
    Observacion      TEXT,
    IdExperiencia    INT,
    IdHabilidad      INT,
    IdFormacion      INT,
    IdProyecto       INT,
    PRIMARY KEY (IdComponente, IdUsuario),
    UNIQUE INDEX UI_IdComponente(IdComponente),
    INDEX Ref831(IdExperiencia),
    INDEX Ref732(IdHabilidad),
    INDEX Ref633(IdFormacion),
    INDEX Ref538(IdProyecto),
    INDEX Ref239(IdUsuario),
    CONSTRAINT Refexperiencia31 FOREIGN KEY (IdExperiencia)
    REFERENCES experiencia(IdExperiencia),
    CONSTRAINT Refhabilidad32 FOREIGN KEY (IdHabilidad)
    REFERENCES habilidad(IdHabilidad),
    CONSTRAINT Refformacion33 FOREIGN KEY (IdFormacion)
    REFERENCES formacion(IdFormacion),
    CONSTRAINT Refproyecto38 FOREIGN KEY (IdProyecto)
    REFERENCES proyecto(IdProyecto),
    CONSTRAINT Refusuario39 FOREIGN KEY (IdUsuario)
    REFERENCES usuario(IdUsuario)
)ENGINE=INNODB;



--
-- TABLE: curriculum
--

--
-- TABLE: curriculum
--

CREATE TABLE curriculum(
    IdCurriculum    INT             AUTO_INCREMENT,
    IdUsuario       INT             NOT NULL,
    Curriculum      VARCHAR(150)    NOT NULL,
    Descripcion     TEXT,
    Banner          VARCHAR(80),
    ImagenPerfil    VARCHAR(80)     NOT NULL,
    Estado          CHAR(1)         NOT NULL,
    PRIMARY KEY (IdCurriculum, IdUsuario),
    UNIQUE INDEX UX_IdUsuarioCurriculum(IdUsuario, Curriculum),
    INDEX IX_Curriculum(Curriculum),
    UNIQUE INDEX UX_IdCurriculum(IdCurriculum),
    INDEX Ref240(IdUsuario),
    CONSTRAINT Refusuario40 FOREIGN KEY (IdUsuario)
    REFERENCES usuario(IdUsuario)
)ENGINE=INNODB
;



--
-- TABLE: componenteCurriculum
--

CREATE TABLE componenteCurriculum
(
    IdCurriculum INT NOT NULL,
    IdComponente INT NOT NULL,
    IdUsuario    INT NOT NULL,
    PRIMARY KEY (IdCurriculum, IdComponente, IdUsuario),
    INDEX Ref319 (IdCurriculum, IdUsuario),
    INDEX Ref1436 (IdComponente, IdUsuario),
    CONSTRAINT Refcurriculum19 FOREIGN KEY (IdCurriculum, IdUsuario)
        REFERENCES curriculum (IdCurriculum, IdUsuario),
    CONSTRAINT Refcomponente36 FOREIGN KEY (IdComponente, IdUsuario)
        REFERENCES componente (IdComponente, IdUsuario)
) ENGINE = INNODB
;



--
-- TABLE: redSocial
--

CREATE TABLE redSocial
(
    IdRedSocial INT AUTO_INCREMENT,
    Red         VARCHAR(60) NOT NULL,
    LogoLink    VARCHAR(80),
    PRIMARY KEY (IdRedSocial),
    UNIQUE INDEX UX_Red (Red)
) ENGINE = INNODB
;



--
-- TABLE: redSocialUsuario
--

CREATE TABLE redSocialUsuario
(
    IdRedSocialUsuario INT          NOT NULL,
    IdUsuario          INT          NOT NULL,
    IdRedSocial        INT          NOT NULL,
    LinkRed            VARCHAR(150) NOT NULL,
    PRIMARY KEY (IdRedSocialUsuario),
    INDEX Ref42 (IdRedSocial),
    INDEX Ref224 (IdUsuario),
    CONSTRAINT RefredSocial2 FOREIGN KEY (IdRedSocial)
        REFERENCES redSocial (IdRedSocial),
    CONSTRAINT Refusuario24 FOREIGN KEY (IdUsuario)
        REFERENCES usuario (IdUsuario)
) ENGINE = INNODB
;


