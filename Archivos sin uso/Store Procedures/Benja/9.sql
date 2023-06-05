DROP PROCEDURE IF EXISTS sp_buscarFormacionesUsuarioEnRangoFecha;
DELIMITER  //
CREATE PROCEDURE sp_buscarFormacionesUsuarioEnRangoFecha(
pIdUsuario INT, 
pFechaInicio DATE,
pFechaFin DATE,
OUT mensajeSalida VARCHAR(100))
FINAL:
BEGIN
	IF (pIdUsuario IS NULL) OR 
            (pFechaInicio IS NULL) OR 
            (pFechaFin IS NULL) THEN
        SET mensajeSalida="Error en los datos de entrada";
        LEAVE  FINAL;
    ELSEIF NOT EXISTS (SELECT * FROM Usuario WHERE IdUsuario = pIdUsuario) THEN
		SET mensajeSalida="El usuario no existe";
        LEAVE  FINAL;
	ELSEIF pFechaInicio>=pFechaFin THEN
		SET mensajeSalida="La FechaInicio no puede ser mayor o igual que la FechaFin";
        LEAVE  FINAL;
	ELSEIF pFechaFin>CURDATE() THEN
		SET mensajeSalida="La FechaFin no puede ser mayor que la Fecha Actual";
        LEAVE  FINAL;
	ELSE
	
	SELECT TituloComponente, 
		Observacion, 
        FechaInicio, 
        FechaFin, 
        Institucion, 
        TipoFormacion
		FROM componente c
			JOIN formacion f ON c.IdFormacion = f.IdFormacion
		WHERE c.IdUsuario = pIdUsuario
		AND FechaInicio BETWEEN pFechaInicio AND pFechaFin
        ORDER BY f.FechaInicio;
    SET mensajeSalida="OK";
    
    END IF;
END //
DELIMITER ;

/* CALLS*/
SELECT TituloComponente, 
		Observacion, 
        FechaInicio, 
        FechaFin, 
        Institucion, 
        TipoFormacion
		FROM componente c
			JOIN formacion f ON c.IdFormacion = f.IdFormacion
		WHERE c.IdUsuario = '6';
/* CALL BUENA*/
CALL sp_buscarFormacionesUsuarioEnRangoFecha('6','2011-01-01','2015-01-01',@mensajeSalida);
SELECT @mensajeSalida;
/* CALLS CON ERROR */
/*fecha fin ayor que la fecha de fin del intervalo*/
CALL sp_buscarFormacionesUsuarioEnRangoFecha('6','2011-01-01','2010-01-01',@mensajeSalida);
SELECT @mensajeSalida;
/* Fecha de Fin mayor que la fecha actual*/
CALL sp_buscarFormacionesUsuarioEnRangoFecha('6','2011-01-01','2070-01-01',@mensajeSalida);
SELECT @mensajeSalida;
/*Se pasa una ID que no posee ningun usuario */
CALL sp_buscarFormacionesUsuarioEnRangoFecha('60000','2012-01-01','2015-01-01',@mensajeSalida);
SELECT @mensajeSalida;
