SELECT TituloComponente,
       Observacion,
       Empresa,
       experiencia.FechaInicio AS InicoExperencia,
       experiencia.FechaFin    AS FinExperencia,
       experiencia.Descripcion,
       Hitos,
       formacion.FechaInicio   AS InicoFormacion,
       formacion.FechaFin      AS FinFormacion,
       Institucion,
       TipoFormacion,
       proyecto.FechaInicio    AS InicoProyecto,
       proyecto.FechaFin       AS FinProyecto,
       Link,
       proyecto.Estado,
       proyecto.Descripcion,
       Recursos,
       TipoHabilidad,
       Escala,
       Detalles
FROM (
         (
             (
                 (
                     (
                         (curriculum JOIN componenteCurriculum
                          ON curriculum.IdCurriculum = componenteCurriculum.IdCurriculum)
                             JOIN componente ON componenteCurriculum.IdComponente = componente.IdComponente)
                         LEFT JOIN experiencia ON componente.IdExperiencia = experiencia.IdExperiencia)
                     LEFT JOIN formacion ON componente.IdFormacion = formacion.IdFormacion)
                 LEFT JOIN proyecto ON componente.IdProyecto = proyecto.IdProyecto)
             LEFT JOIN habilidad ON componente.IdHabilidad = habilidad.IdHabilidad)
WHERE curriculum.IdCurriculum = '5'
ORDER BY habilidad.IdHabilidad, proyecto.IdProyecto, proyecto.FechaInicio,formacion.IdFormacion, formacion.FechaInicio,
          experiencia.IdExperiencia, experiencia.FechaInicio;