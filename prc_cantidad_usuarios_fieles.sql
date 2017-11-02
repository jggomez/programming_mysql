CREATE DEFINER=`root`@`localhost` PROCEDURE `Prc_UsuariosFieles`(
	OUT `cant_usuarios_fieles_out` INT
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Determina la cantidad de usuarios fieles'
BEGIN

	Declare fin INT Default False;
	Declare v_id, v_fiel INT;
	Declare usuarios_cursor CURSOR For Select id From usuario;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = true;
	
	Set cant_usuarios_fieles_out = 0;
	
	Open usuarios_cursor;
	
	read_loop : LOOP

		FETCH usuarios_cursor INTO v_id;
	
		IF fin THEN
			LEAVE read_loop;
		END IF;		
		
		SET v_fiel = Func_EsFiel(v_id);
		
		IF(v_fiel = 1) THEN
			SET cant_usuarios_fieles_out = cant_usuarios_fieles_out + 1;
		END IF;		
	
	END LOOP;
	
	Close usuarios_cursor;

	
END