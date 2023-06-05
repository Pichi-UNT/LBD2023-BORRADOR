DROP PROCEDURE IF EXISTS sp_modificarUsuario;
DELIMITER  //
CREATE PROCEDURE sp_modificarUsuario(
pIdUsuario INT, 
pNombre VARCHAR(120), 
pApellido VARCHAR(120), 
pCorreo VARCHAR(256),
pTelefono VARCHAR(15),
pNick VARCHAR(40),
pPass CHAR(60),
pEstado CHAR(1),
pRol CHAR(1),
OUT mensajeSalida VARCHAR(100))
FINAL:
BEGIN
	IF (pIdUsuario IS NULL) OR 
			(pNombre IS NULL) OR 
			(pApellido IS NULL) OR 
			(pCorreo IS NULL) OR 
            (pNick IS NULL) OR 
            (pPass IS NULL) OR 
            (pEstado IS NULL) OR 
            (pRol IS NULL) THEN
        SET mensajeSalida='Error en los datos del Usuario';
        LEAVE  FINAL;
    ELSEIF NOT EXISTS (SELECT * FROM Usuario WHERE IdUsuario = pIdUsuario) THEN
		SET mensajeSalida='El usuario no existe';
        LEAVE  FINAL;
	ELSEIF EXISTS (SELECT * FROM Usuario WHERE (Correo = pCorreo) AND (IdUsuario=pIdUsuario)) THEN
		SET mensajeSalida='Ya existe un usuario con ese Correo';
        LEAVE  FINAL;
    ELSEIF EXISTS (SELECT * FROM Usuario WHERE (Nick = pNick) AND (IdUsuario=pIdUsuario)) THEN
		SET mensajeSalida='Ya existe un usuario con ese Nick';
        LEAVE  FINAL;
	IF pCorreo NOT REGEXP
       "^[a-zA-Z0-9][a-zA-Z0-9.!#$%&'+-/=?^_`{|}~]?[a-zA-Z0-9.-]?@[a-zA-Z0-9][a-zA-Z0-9.-]*?[a-zA-Z0-9]?\.[a-zA-Z]{2,63}$" THEN
        SET pMensaje = 'Formato de email incorrecto.';
        LEAVE FINAL;
    END IF;
	ELSE
	START TRANSACTION;
	UPDATE usuario
    SET Apellido= pApellido,
        Nombre=pNombre,
        Correo= pCorreo,
        Telefono=pTelefono,
        Nick=pNick,
        Pass=pPass ,
        Estado=pEstado ,
        Rol=pRol
    WHERE IdUsuario = pIdUsuario;
    SET mensajeSalida='OK';
    COMMIT;
    END IF;
END //
DELIMITER ; 
/* CALLS*/
INSERT INTO usuario (IdUsuario, Nombre, Apellido, Correo, Telefono, Nick, Pass, Estado)
VALUES (200, 'Juan', 'Pérez', 'juan.perez@example.com', '1234567890', 'juanperezZZZZZZZZZZZZZ', 'password1', 'A');
/* CALL BUENA*/
CALL sp_modificarUsuario(200, 'CarLoTaS', 'Pérez', 'juan.perez@example.com.AR.R.T.Y.U.R', '1234567890', 'juanperezAA', 'password111111', 'A','A',@mensajeSalida);
SELECT * FROM Usuario WHERE IdUsuario='200';
SELECT @mensajeSalida;
/* CALLS CON ERROR */
/*Se pasaran como parametyros valores NULL en campos que no pueden ser nulos los valores que no se pasan*/
CALL sp_modificarUsuario(200, NULL, 'Pérez', 'juan.perez@example.com.AR.R.T.Y.U.R', '1234567890', 'juanperezAA', NULL, 'A','A',@mensajeSalida);
SELECT @mensajeSalida;
/* Se pasa una ID que no posee ningun usuario*/
CALL sp_modificarUsuario(20000, 'CarLoTaS', 'Pérez', 'juan.perez@example.com.AR.R.T.Y.U.R', '1234567890', 'juanperezAA', 'password111111', 'A','A',@mensajeSalida);
SELECT @mensajeSalida;
/*En el parametro pNick se paso un Nick que ya posee otro usuario */
CALL sp_modificarUsuario(200, 'CarLoTaS', 'Pérez', 'juan.perez@example.com.AR', '1234567890', 'juanperez', 'password111111', 'A','A',@mensajeSalida);
SELECT @mensajeSalida;