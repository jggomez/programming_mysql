CREATE PROCEDURE `prc_PreguntasPorCategoria`(
	IN `idCategoria_IN` INT
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
	
	Select 
		pregunta.id,
		pregunta.pregunta
	From 
		examen Inner Join examen_pregunta ep On examen.id = ep.idexamen
		Inner Join pregunta On pregunta.id = ep.idpregunta
	Where 
		examen.idcategoria = idCategoria_IN;
	
END