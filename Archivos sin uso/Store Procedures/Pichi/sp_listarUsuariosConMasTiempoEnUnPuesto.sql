DROP PROCEDURE IF EXISTS `sp_listarUsuariosConMasTiempoEnUnPuesto`;
DELIMITER //

CREATE PROCEDURE `sp_listarUsuariosConMasTiempoEnUnPuesto`()
FINAL:
BEGIN
    -- Descripcion
    /*
    Este sp devuelve un ranking con los usuarios que más tiempo permanecen en un puesto laboral.
    */
    SELECT DISTINCT Nick, Nombre, Apellido
    FROM ((usuario JOIN componente ON usuario.IdUsuario = componente.IdUsuario) JOIN experiencia
          ON componente.IdExperiencia = experiencia.IdExperiencia)
    ORDER BY DATEDIFF(FechaFin, FechaInicio) DESC;


END //

DELIMITER ;

CALL sp_listarUsuariosConMasTiempoEnUnPuesto();

