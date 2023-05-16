-- 2. Realizar un listado de todas las redes sociales. Mostrar red, cantidad. Incluir las que no tengan usuarios en cero.
SELECT r.IdRedSocial,r.red, COALESCE(COUNT(ru.IdRedSocial),0)
FROM redsocial r
         left JOIN redsocialusuario ru on r.IdRedSocial = ru.IdRedSocial GROUP BY r.IdRedSocial, r.red;

-- 4. Dado un usuario, mostrar los curriculum que hizo.
SELECT c.IdCurriculum, c.IdUsuario, c.Curriculum, c.Descripcion, c.Banner, c.ImagenPerfil, c.Estado
FROM usuario u
         JOIN curriculum c on u.IdUsuario = c.IdUsuario
WHERE u.IdUsuario = 6;

-- 6. Hacer un ranking con los idiomas que más cargan los usuarios.
SELECT c.TituloComponente, COUNT(c.TituloComponente) CantidadUsuariosConIdioma
FROM habilidad h
         join componente c on h.IdHabilidad = c.IdHabilidad
WHERE TipoHabilidad = 'Idioma'
GROUP BY c.TituloComponente
ORDER BY CantidadUsuariosConIdioma DESC;

-- 8. Crear una vista con la funcionalidad del apartado 3. Solo aparece una vez un usuario en el ranking
DROP VIEW IF EXISTS v_RankingUsuariosPuestoLaboral;
CREATE VIEW v_RankingUsuariosPuestoLaboral (Nick, Nombre, Apellido)
AS
SELECT DISTINCT Nick, Nombre, Apellido
FROM ((usuario JOIN componente ON usuario.IdUsuario = componente.IdUsuario) JOIN experiencia
      ON componente.IdExperiencia = experiencia.IdExperiencia)
ORDER BY DATEDIFF(FechaFin, FechaInicio) DESC;

SELECT *
FROM v_RankingUsuariosPuestoLaboral;
-- 10: Realizar una vista que considere importante para su modelo. También dejar escrito el enunciado de la misma.
-- ELABORAR UNA VISTA QUE PERMITA OBTENER LAS REDES SOCIALES DE LOS USUARIOS, DE MANERA DE PODER FILTRAR TODAS LAS REDES DE UN USUARIO DE FORMA MAS SENCILLA
DROP VIEW IF EXISTS v_RedesUsuarios;
CREATE VIEW v_RedesUsuarios
AS
SELECT u.IdUsuario, r.LinkRed, rs.Red, rs.LogoLink
FROM usuario u
         JOIN redSocialUsuario r ON u.IdUsuario = r.IdUsuario
         JOIN redSocial rs
         JOIN redSocial p ON p.IdRedSocial = r.IdRedSocial;

SELECT *
FROM v_RedesUsuarios;
