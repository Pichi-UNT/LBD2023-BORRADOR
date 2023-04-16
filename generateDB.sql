CREATE SCHEMA IF NOT EXISTS LBD2023G2;
USE LBD2023G2;

DROP TABLE IF EXISTS componenteCurriculum;
DROP TABLE IF EXISTS formacion;
DROP TABLE IF EXISTS habilidad;
DROP TABLE IF EXISTS experiencia;
DROP TABLE IF EXISTS idiomaUsuario;
DROP TABLE IF EXISTS proyectocurriculum;
DROP TABLE IF EXISTS proyecto;
DROP TABLE IF EXISTS idioma;
DROP TABLE IF EXISTS curriculum;
DROP TABLE IF EXISTS componente;
DROP TABLE IF EXISTS redsocialusuario;
DROP TABLE IF EXISTS redsocial;
DROP TABLE IF EXISTS usuario;

--
-- TABLE: usuario
--

CREATE TABLE IF NOT EXISTS usuario
(
    IdUsuario INT          NOT NULL AUTO_INCREMENT,
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
-- TABLE: componente
--

CREATE TABLE IF NOT EXISTS componente
(
    IdComponente INT AUTO_INCREMENT,
    IdUsuario    INT NOT NULL,
    Titulo       VARCHAR(150),
    Observacion  TEXT,
    PRIMARY KEY (IdComponente, IdUsuario),
    UNIQUE INDEX UI_IdComponente (IdComponente),
    INDEX Ref218 (IdUsuario),
    CONSTRAINT Refusuario182 FOREIGN KEY (IdUsuario)
        REFERENCES usuario (IdUsuario)
) ENGINE = INNODB
;



--
-- TABLE: curriculum
--

CREATE TABLE IF NOT EXISTS curriculum
(
    IdCurriculum INT AUTO_INCREMENT,
    IdUsuario    INT          NOT NULL,
    Titulo       VARCHAR(100) NOT NULL,
    Descripcion  TEXT,
    Banner       VARCHAR(80),
    ImagenPerfil VARCHAR(80)  NOT NULL,
    Estado       CHAR(1)      NOT NULL DEFAULT 'V', -- V: Visible I: Invisible
    PRIMARY KEY (IdCurriculum),
    INDEX IX_Curriculum (Titulo),
    UNIQUE INDEX UX_CurriculumIdUsuario (Titulo, IdUsuario),
    INDEX Ref227 (IdUsuario),
    CONSTRAINT Refusuario272 FOREIGN KEY (IdUsuario)
        REFERENCES usuario (IdUsuario)
) ENGINE = INNODB
;



--
-- TABLE: componenteCurriculum
--

CREATE TABLE IF NOT EXISTS componenteCurriculum
(
    IdCurriculum INT NOT NULL,
    IdUsuario    INT NOT NULL,
    IdComponente INT NOT NULL,
    PRIMARY KEY (IdCurriculum, IdUsuario, IdComponente),
    INDEX Ref319 (IdCurriculum),
    INDEX Ref1420 (IdUsuario, IdComponente),
    CONSTRAINT Refcurriculum192 FOREIGN KEY (IdCurriculum)
        REFERENCES curriculum (IdCurriculum),
    CONSTRAINT Refcomponente202 FOREIGN KEY (IdComponente, IdUsuario)
        REFERENCES componente (IdComponente, IdUsuario)
) ENGINE = INNODB
;



--
-- TABLE: experiencia
--

CREATE TABLE IF NOT EXISTS experiencia
(
    IdComponente INT          NOT NULL,
    IdUsuario    INT          NOT NULL,
    Empresa      VARCHAR(100) NOT NULL,
    FechaInicio  DATE         NOT NULL,
    FechaFin     DATE,
    Descripcion  TEXT,
    Hitos        JSON,
    PRIMARY KEY (IdComponente, IdUsuario),
    INDEX Ref1421 (IdUsuario, IdComponente),
    CONSTRAINT Refcomponente212 FOREIGN KEY (IdComponente, IdUsuario)
        REFERENCES componente (IdComponente, IdUsuario)
) ENGINE = INNODB
;



--
-- TABLE: formacion
--

CREATE TABLE IF NOT EXISTS formacion
(
    IdComponente  INT          NOT NULL,
    IdUsuario     INT          NOT NULL,
    FechaInicio   DATE         NOT NULL,
    FechaFin      DATE,
    Institucion   VARCHAR(100) NOT NULL,
    TipoFormacion VARCHAR(30),
    PRIMARY KEY (IdComponente, IdUsuario),
    INDEX Ref1423 (IdUsuario, IdComponente),
    CONSTRAINT Refcomponente232 FOREIGN KEY (IdComponente, IdUsuario)
        REFERENCES componente (IdComponente, IdUsuario)
) ENGINE = INNODB
;



--
-- TABLE: habilidad
--

CREATE TABLE IF NOT EXISTS habilidad
(
    IdComponente  INT     NOT NULL,
    IdUsuario     INT     NOT NULL,
    TipoHabilidad CHAR(1) NOT NULL,
    Escala        TINYINT NOT NULL,
    Detalles      JSON,
    PRIMARY KEY (IdComponente, IdUsuario),
    INDEX Ref1422 (IdUsuario, IdComponente),
    CONSTRAINT Refcomponente222 FOREIGN KEY (IdComponente, IdUsuario)
        REFERENCES componente (IdComponente, IdUsuario),
    CHECK (Escala > 0),
    CHECK (Escala<= 5)
) ENGINE = INNODB
;



--
-- TABLE: idioma
--

CREATE TABLE IF NOT EXISTS idioma
(
    Idioma CHAR(3) NOT NULL,
    PRIMARY KEY (Idioma)
) ENGINE = INNODB
;



--
-- TABLE: idiomaUsuario
--

CREATE TABLE IF NOT EXISTS idiomaUsuario
(
    IdUsuario INT     NOT NULL,
    Idioma    CHAR(3) NOT NULL,
    Nivel     ENUM('Basico','Intermedio','Avanzado'),
    PRIMARY KEY (IdUsuario, Idioma),
    INDEX Ref25 (IdUsuario),
    INDEX Ref1016 (Idioma),
    CONSTRAINT Refusuario52 FOREIGN KEY (IdUsuario)
        REFERENCES usuario (IdUsuario),
    CONSTRAINT Refidioma162 FOREIGN KEY (Idioma)
        REFERENCES idioma (Idioma)
) ENGINE = INNODB
;



--
-- TABLE: proyecto
--

CREATE TABLE IF NOT EXISTS proyecto
(
    IdProyecto  INT AUTO_INCREMENT,
    IdUsuario   INT          NOT NULL,
    Titulo      VARCHAR(150) NOT NULL,
    FechaInicio DATE         NOT NULL,
    FechaFin    DATE,
    Link        VARCHAR(120),
    Estado      CHAR(1)      NOT NULL,
    Descripcion TEXT,
    Recursos    JSON         NOT NULL,
    PRIMARY KEY (IdProyecto),
    INDEX IX_Proyecto (Titulo),
    UNIQUE INDEX UX_ProyectoIdUsuario (Titulo, IdUsuario),
    INDEX Ref225 (IdUsuario),
    CONSTRAINT Refusuario252 FOREIGN KEY (IdUsuario)
        REFERENCES usuario (IdUsuario)
) ENGINE = INNODB
;



--
-- TABLE: proyectoCurriculum
--

CREATE TABLE IF NOT EXISTS proyectoCurriculum
(
    IdCurriculum INT NOT NULL,
    IdProyecto   INT NOT NULL,
    PRIMARY KEY (IdCurriculum, IdProyecto),
    INDEX Ref39 (IdCurriculum),
    INDEX Ref526 (IdProyecto),
    CONSTRAINT Refcurriculum92 FOREIGN KEY (IdCurriculum)
        REFERENCES curriculum (IdCurriculum),
    CONSTRAINT Refproyecto262 FOREIGN KEY (IdProyecto)
        REFERENCES proyecto (IdProyecto)
) ENGINE = INNODB
;



--
-- TABLE: redSocial
--

CREATE TABLE IF NOT EXISTS redSocial
(
    IdRedSocial INT AUTO_INCREMENT,
    Red         VARCHAR(60) NOT NULL,
    LogoLink    CHAR(10),
    PRIMARY KEY (IdRedSocial),
    UNIQUE INDEX UX_Red (red)
) ENGINE = INNODB
;



--
-- TABLE: redSocialUsuario
--

CREATE TABLE IF NOT EXISTS redSocialUsuario
(
    IdRedSocialUsuario INT          NOT NULL,
    IdUsuario          INT          NOT NULL,
    IdRedSocial        INT          NOT NULL,
    LinkRed            VARCHAR(150) NOT NULL,
    PRIMARY KEY (IdRedSocialUsuario),
    INDEX Ref42 (IdRedSocial),
    INDEX Ref224 (IdUsuario),
    CONSTRAINT RefredSocial22 FOREIGN KEY (IdRedSocial)
        REFERENCES redSocial (IdRedSocial),
    CONSTRAINT Refusuario242 FOREIGN KEY (IdUsuario)
        REFERENCES usuario (IdUsuario)
) ENGINE = INNODB
;




