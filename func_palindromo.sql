CREATE FUNCTION `func_palindromo`(
	`palabra_in` VARCHAR(200)
)
RETURNS VARCHAR(2)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN

   Declare caracter varchar(1);
   Declare indexIni int;
   Declare palabraReves varchar(200);
   Declare esPalindromo varchar(2);

   Set indexIni = (Select LENGTH(palabra_in));
   Set palabraReves = '';
   Set esPalindromo = 'No';
	
   recorrerCadena : LOOP

       Set caracter = (Select SUBSTRING(palabra_in, indexIni, 1));
       Set palabraReves = (Select Concat(palabraReves, caracter));

       Set indexIni = indexIni - 1;

       IF indexIni = 0 THEN
           Leave recorrerCadena;
       END IF;

       ITERATE recorrerCadena;

   End LOOP recorrerCadena;
   
   IF (palabra_in = palabraReves) THEN
   	Set esPalindromo = 'Si';
   END IF;    
	
	Return esPalindromo;

END