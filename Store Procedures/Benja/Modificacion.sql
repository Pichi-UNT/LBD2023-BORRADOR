DROP PROCEDURE IF EXISTS modificarUsuario;
DELIMITER //

CREATE PROCEDURE modificarUsuario(pIdUsuario INT, pNombre VARCHAR(120), pApellido VARCHAR(120), pCorreo VARCHAR(256),
 pTelefono VARCHAR(15),pCuenta VARCHAR(40),pPass CHAR(60),pEstado CHAR(1),pRol CHAR(1))
FINAL:
BEGIN
    DECLARE mensajeSalida Text;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION -- lo puedo cambiar por el numero de la exception
        BEGIN
            SHOW ERRORS;
            SELECT 'Error en la transacción. Contáctese con el administrador.' AS Mensaje;
            ROLLBACK;
        END;
    IF pIdUsuario IS NULL THEN
        SET mensajeSalida="El campo IdUsuario no puede ser nulo.";
        RETURN mensajeSalida;
    END IF;

    UPDATE usuario
    SET Apellido= pApellido,
        Nombre=pNombre,
        Correo= pCorreo,
        Telefono=pTelefono,
        Cuenta=pCuenta,
        Pass=pPass ,
        Estado=pEstado ,
        Rol=pRol
    WHERE IdUsuario = pIdUsuario;
    SET mensajeSalida="OK";
    RETURN mensajeSalida;
END //


DELIMITER ;