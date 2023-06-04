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

