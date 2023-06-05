DROP PROCEDURE IF EXISTS sp_buscarUsuario;
---
DROP PROCEDURE IF EXISTS sp_buscarUsuario;
DELIMITER  //
CREATE PROCEDURE sp_buscarUsuario(
    pIdUsuario INT,
    pNombre VARCHAR(120),
    pApellido VARCHAR(120),
    pCorreo VARCHAR(256),
    pNick VARCHAR(40))
FINAL:
BEGIN
    SELECT *
    FROM Usuario
    WHERE (
                  (IdUsuario = pIdUsuario OR pIdUsuario IS NULL) AND
                  (Correo LIKE CONCAT(pCorreo, '%') OR pCorreo IS NULL) AND
                  (Nick LIKE CONCAT(pNick, '%') OR pNick IS NULL) AND
                  (Apellido LIKE CONCAT(pApellido, '%') OR pApellido IS NULL) AND
                  (Nombre LIKE CONCAT(pNombre, '%') OR pNombre IS NULL));
END //
DELIMITER ;

CALL sp_buscarUsuario (NULL,'Juan','Pérez',NULL,NULL) ;
CALL sp_buscarUsuario (NULL,'Juan',NULL,NULL,NULL) ;
CALL sp_buscarUsuario (1,NULL,NULL,NULL,'juanperez') ;
CALL sp_buscarUsuario (NULL,'Juan',NULL,'juanperez',NULL) ;