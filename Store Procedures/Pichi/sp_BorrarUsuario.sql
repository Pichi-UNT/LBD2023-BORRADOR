DROP PROCEDURE IF EXISTS `sp_borrarUsuario`;
DELIMITER //

CREATE PROCEDURE `sp_borrarUsuario`(pIdUsuario int, OUT pMensaje varchar(256))
FINAL:
BEGIN
    -- Descripcion
    /*
    Permite borrar un usuario siempre que este en estado B y no tenga curriculums ni componentes asociados.
    Devuelve OK o el mensaje de error en pMensaje.
    */
    -- Declaraciones
    -- Exception handler
    DECLARE EXIT HANDLER FOR SQLEXCEPTION -- lo puedo cambiar por el numero de la exception
        BEGIN
            SHOW ERRORS;
            SET pMensaje = 'Error en la transacción. Contáctese con el administrador.';
            ROLLBACK;
        END;

    IF NOT EXISTS(SELECT IdUsuario FROM usuario WHERE IdUsuario = pIdUsuario) THEN
        SET pMensaje = 'Error al borrar usuario.';
        LEAVE FINAL;
    END IF;

    IF pIdUsuario IS NULL THEN
        SET pMensaje = 'El campo id usuario no puede ser nulo o estar vacio.';
        LEAVE FINAL;
    END IF;

    IF NOT EXISTS(SELECT IdUsuario
                  FROM usuario
                  WHERE IdUsuario = pIdUsuario
                    AND Estado = 'B') THEN
        SET pMensaje = 'Error no puede borrar usuarios activados.';
        LEAVE FINAL;
    END IF;

    IF EXISTS(SELECT IdUsuario FROM curriculum WHERE IdUsuario = pIdUsuario) THEN
        SET pMensaje = 'Error al borrar usuario. Tiene curriculums asociados.';
        LEAVE FINAL;
    END IF;

    IF EXISTS(SELECT IdUsuario FROM componente WHERE IdUsuario = pIdUsuario) THEN
        SET pMensaje = 'Error al borrar usuario. Tiene proyectos/formaciones/habilidades/experiencias asociados.';
        LEAVE FINAL;
    END IF;

    DELETE FROM usuario WHERE IdUsuario = pIdUsuario;

    SET pMensaje = 'OK';

END //

DELIMITER ;

-- Se crea un usuario para hacer las pruebas pertinentes
CALL sp_crearUsuario('Por borrar', 'Por Borrar', 'Borrado@agustin.com',
                                   '123456879', 'borrar12345', '12345', @MensajeSalida);
SELECT @MensajeSalida;
-- Agregar el id que aparezca en la salida anterior. Deberia ser el 24 si se mantuvo el orden de insercion nuestro
update usuario
set Estado = 'B'
where IdUsuario=24;

-- Caso de borrado exitoso. Mensaje: OK
CALL sp_borrarUsuario(24,@MensajeSalida);
SELECT @MensajeSalida;

-- Se intenta borrar un usuario activo. Se espera mensaje: Error no puede borrar usuarios activados.
CALL sp_borrarUsuario(19,@MensajeSalida);
SELECT @MensajeSalida;

-- Se intenta borrar un usuario con un curriculum asociado. Se espera mensaje: Error al borrar usuario. Tiene curriculums asociados.
CALL sp_borrarUsuario(20,@MensajeSalida);
SELECT @MensajeSalida;

-- Se intenta borrar un usuario pasando el ID null. Se espera mensaje: Error al borrar usuario.
CALL sp_borrarUsuario(null,@MensajeSalida);
SELECT @MensajeSalida;

