DROP PROCEDURE IF EXISTS `sp_ObtenerRedesSocialesUsuario`;
DELIMITER //

CREATE PROCEDURE `sp_ObtenerRedesSocialesUsuario`(pIdUsuario int)
FINAL:
BEGIN
    -- Descripcion
    /*
    Este sp permite obtener las redes sociales de un usuario a partir de su id
    */
    -- Declaraciones

    -- Exception handler
    SELECT r.LinkRed, rs.Red, rs.LogoLink
    FROM usuario u
             JOIN redSocialUsuario r ON u.IdUsuario = r.IdUsuario
             JOIN redSocial rs
             JOIN redSocial p ON p.IdRedSocial = r.IdRedSocial
    WHERE r.IdUsuario=pIdUsuario;


END //

DELIMITER ;
-- Uso correcto del SP
CALL sp_ObtenerRedesSocialesUsuario(1);
-- Si no se coloca un ID valido no se retorna ninguna salida. Tabla vacia.
CALL sp_ObtenerRedesSocialesUsuario(NULL);
CALL sp_ObtenerRedesSocialesUsuario(-1);
-- Si se coloca un ID inexistente no se retorna ninguna salida. Tabla vacia.
CALL sp_ObtenerRedesSocialesUsuario(5000);