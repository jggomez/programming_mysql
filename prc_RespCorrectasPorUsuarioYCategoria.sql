CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_RespCorrectasPorUsuarioYCategoria`(
	IN `IdUsuario_IN` INT,
	IN `IdCategoria_IN` INT

)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN

	Select 
		count(ep.correcto) correctas
	From 
		respuesta_usuario rpu Inner Join examen_pregunta ep On
			rpu.idexamen_pregunta = ep.id
		Inner Join examen On examen.id = ep.idexamen
	Where 
		rpu.idusuario = IdUsuario_IN
		and ep.correcto = 1
		and examen.idcategoria = IdCategoria_IN;
		
END