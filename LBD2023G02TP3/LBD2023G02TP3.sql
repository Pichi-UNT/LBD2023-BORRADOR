-- Resolucion completa del TP3
-- Punto 1,2,3
CREATE TABLE `aud_usuario`
(
    `Id`         BIGINT       NOT NULL AUTO_INCREMENT,
    `FechaAud`   DATETIME     NOT NULL,
    `UsuarioAud` VARCHAR(30)  NOT NULL,
    `IP`         VARCHAR(40)  NOT NULL,
    `UserAgent`  VARCHAR(255) NULL,
    `Aplicacion` VARCHAR(50)  NOT NULL,
    `Motivo`     VARCHAR(100) NULL,
    `TipoAud`    CHAR(1)      NOT NULL, -- Insercion(I), Borrado(B), Modificacion(A:Antes o D:Despues)
    IdUsuario    INT,
    Nombre       VARCHAR(120) NOT NULL,
    Apellido     VARCHAR(120) NOT NULL,
    Correo       VARCHAR(256) NOT NULL,
    Telefono     VARCHAR(15),
    Nick         VARCHAR(40)  NOT NULL,
    Pass         CHAR(60)     NOT NULL,
    Estado       CHAR(1)      NOT NULL,
    Rol          CHAR(1)      NOT NULL,
    PRIMARY KEY (`Id`),
    INDEX `IX_FechaAud` (`FechaAud` ASC),
    INDEX `IX_Usuario` (`UsuarioAud` ASC),
    INDEX `IX_IP` (`IP` ASC),
    INDEX `IX_Aplicacion` (`Aplicacion` ASC),
    INDEX `IX_IdComercio` (`IdUsuario` ASC)
) ENGINE = InnoDB
  AUTO_INCREMENT = 0
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='Tabla que almacena la auditoria de los usuarios del sistema.';

CREATE TRIGGER usuario_AFTER_INSERT
    AFTER INSERT
    ON usuario
    FOR EACH ROW
BEGIN
    INSERT INTO aud_usuario
    VALUES (0, NOW(), SUBSTRING_INDEX(USER(), '@', 1), SUBSTRING_INDEX(USER(), '@', -1), NULL,
            SUBSTRING_INDEX(USER(), '@', -1), NULL, 'I',
            NEW.IdUsuario, NEW.Nombre, NEW.Apellido, NEW.Correo, NEW.Telefono, NEW.Nick,New.Pass,NEW.Estado,NEW.Rol);
END;

CREATE TRIGGER usuario_AFTER_DELETE
    AFTER DELETE
    ON usuario
    FOR EACH ROW
BEGIN
    INSERT INTO aud_usuario
    VALUES (0, NOW(), SUBSTRING_INDEX(USER(), '@', 1), SUBSTRING_INDEX(USER(), '@', -1), NULL,
            SUBSTRING_INDEX(USER(), '@', -1), NULL, 'B',
            OLD.IdUsuario, OLD.Nombre, OLD.Apellido, OLD.Correo, OLD.Telefono, OLD.Nick,OLD.Pass,OLD.Estado,OLD.Rol);
END;

CREATE TRIGGER usuario_AFTER_UPDATE
    AFTER UPDATE
    ON usuario
    FOR EACH ROW
BEGIN

    INSERT INTO aud_usuario
    VALUES (0, NOW(), SUBSTRING_INDEX(USER(), '@', 1), SUBSTRING_INDEX(USER(), '@', -1), NULL,
            SUBSTRING_INDEX(USER(), '@', -1), NULL, 'A',
            OLD.IdUsuario, OLD.Nombre, OLD.Apellido, OLD.Correo, OLD.Telefono, OLD.Nick,OLD.Pass,OLD.Estado,OLD.Rol);

    INSERT INTO aud_usuario
    VALUES (0, NOW(), SUBSTRING_INDEX(USER(), '@', 1), SUBSTRING_INDEX(USER(), '@', -1), NULL,
            SUBSTRING_INDEX(USER(), '@', -1), NULL, 'D',
             NEW.IdUsuario, NEW.Nombre, NEW.Apellido, NEW.Correo, NEW.Telefono, NEW.Nick,New.Pass,NEW.Estado,NEW.Rol);
END;

-- Procedimientos almacenados
-- 4. Creacion de usuario
DROP PROCEDURE IF EXISTS `sp_crearUsuario`;
DELIMITER //

CREATE PROCEDURE `sp_crearUsuario`(pNombres varchar(120), pApellidos varchar(120), pCorreo varchar(256),
                                   pTelefono varchar(15), pNick varchar(40), pPass char(60), out pMensaje varchar(256))
FINAL:
BEGIN
    -- Descripcion
    /*
    Este sp permite crear un usuario, controlando que el nick y el correo no se encuentren registrados.
    Se debe garantizar que los campos nombres, apellidos y pass no pueden estan vacios.
    Se crea en Estado:A (activo) y con el Rol: U (usuario). Devuelve OK en pMensaje.
    */
    -- Declaraciones

    -- Exception handler
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            SHOW ERRORS;
            SET pMensaje = 'Error en la transacción. Contáctese con el administrador.';
            ROLLBACK;
        END;

    IF TRIM(pApellidos) = '' OR pApellidos IS NULL THEN
        SET pMensaje = 'El campo apellido no puede estar vacio o ser nulo.';
        LEAVE FINAL;
    END IF;

    IF TRIM(pNombres) = '' OR pNombres IS NULL THEN
        SET pMensaje = 'El campo nombre no puede estar vacio o ser nulo.';
        LEAVE FINAL;
    END IF;

    IF TRIM(pCorreo) = '' OR pCorreo IS NULL THEN
        SET pMensaje = 'El campo correo no puede estar vacio o ser nulo.';
        LEAVE FINAL;
    END IF;

    IF TRIM(pNick) = '' OR pNick IS NULL THEN
        SET pMensaje = 'El campo nick no puede estar vacio o ser nulo.';
        LEAVE FINAL;
    END IF;

    IF TRIM(pPass) = '' OR pPass IS NULL THEN
        SET pMensaje = 'El campo pass no puede estar vacio o ser nulo.';
        LEAVE FINAL;
    END IF;

    IF pCorreo NOT REGEXP
       "^[a-zA-Z0-9][a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]*?[a-zA-Z0-9._-]?@[a-zA-Z0-9][a-zA-Z0-9._-]*?[a-zA-Z0-9]?\\.[a-zA-Z]{2,63}$" THEN
        SET pMensaje = 'Formato de email incorrecto.';
        LEAVE FINAL;
    END IF;

    IF EXISTS(SELECT IdUsuario FROM usuario where Nick = pNick) THEN
        SET pMensaje ='El Nick ya se encuentra registrado';
        LEAVE FINAL;
    END IF;

    IF EXISTS(SELECT IdUsuario FROM usuario WHERE Correo = pCorreo) THEN
        SET pMensaje = 'El correo electronico ya se encuentra registrado';
        LEAVE FINAL;
    END IF;

    INSERT INTO usuario (Nombre, Apellido, Correo, Telefono, Nick, Pass, Estado, Rol)
    VALUES (pNombres, pApellidos, pCorreo, pTelefono, pNick, pPass, 'A', 'U');
    SET pMensaje = ('OK ');

END //

DELIMITER ;

-- Salida Correcta
CALL sp_crearUsuario('Agustin', 'Carrizo Avellaneda', 'carrizo@agustin.com',
                                   '123456879', 'pichi12345', '12345', @MensajeSalida);
SELECT @MensajeSalida;

-- Se prueba si se acepta Nombre nulos. Salida esperada: El campo nombre no puede estar vacio o ser nulo.
CALL sp_crearUsuario(NULL, 'Carrizo Avellaneda', 'carrizo@agustin.com',
                                   '123456879', 'pichi12345', '12345', @MensajeSalida);
SELECT @MensajeSalida;

-- Se prueba si se acepta Nick repetidos. Salida esperada: El Nick ya se encuentra registrado
CALL sp_crearUsuario('Ramiro', 'Velazco', 'velazco@es.com',
                                   '123456879', 'pichi12345', '12345', @MensajeSalida);
SELECT @MensajeSalida;

-- Se prueba si se acepta correo repetidos. Salida esperada: El correo ya se encuentra registrado
CALL sp_crearUsuario('Ramiro', 'Velazco', 'carrizo@agustin.com',
                                   '123456879', 'ramiro12345', '12345', @MensajeSalida);
SELECT @MensajeSalida;

-- Se prueba si se acepta correo con formato invalido. Salida esperada: Formato de email incorrecto.
CALL sp_crearUsuario('Juan', 'Cascakes', 'carr.com',
                                   '123456879', 'Juan12345', '12345', @MensajeSalida);
SELECT @MensajeSalida;


