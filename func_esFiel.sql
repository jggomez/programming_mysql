CREATE DEFINER=`root`@`localhost` FUNCTION `Func_EsFiel`(
	`idUsuario_in` INT
)
RETURNS int(11)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Función que determina que si un usuario es fiel por el numero de ingresos a la plataforma'
BEGIN
	
	Declare esFiel int;
	Set esFiel = 0;
	
	IF((Select count(idUsuario) 
		from ingresos 
		where idUsuario = idUsuario_in) > 2) Then
		
		Set esFiel = 1;
		
	End IF;
	
	Return esFiel;
END