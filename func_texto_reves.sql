CREATE FUNCTION `func_texto_reves`(
	`pregunta_in` VARCHAR(200)
)
RETURNS varchar(200)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Función que coloca el texto de la pregunta al reves'
BEGIN

    Declare caracter varchar(1);
    Declare indexIni int;
    Declare preguntaReves varchar(200);

	Set indexIni = (Select LENGTH(pregunta_in));
    Set preguntaReves = '';
	
    recorrerCadena : LOOP

        Set caracter = (Select SUBSTRING(pregunta_in, indexIni, 1));
        Set preguntaReves = (Select Concat(preguntaReves, caracter));

        Set indexIni = indexIni - 1;

        IF indexIni = 0 THEN
            Leave recorrerCadena;
        END IF;

        ITERATE recorrerCadena;

    End LOOP recorrerCadena;
    	
	Return preguntaReves;
    
END