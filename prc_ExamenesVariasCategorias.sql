CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ExamenesVariasCategorias`()
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN

	Declare fin INT Default False; 
	Declare v_titulo Varchar(100);
	Declare v_id, v_cont_exam, v_cont_examen Int Default 0;	
	
	#se declara cursor y variable de fin
	DECLARE cursor_examenes CURSOR FOR Select id, titulo From examen;	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = True;	
	
	Drop Table ExamenesCategorias;
	Create Temporary Table ExamenesCategorias (id int, titulo varchar(100));
	
	OPEN cursor_examenes;
	
	leer_cursor : LOOP		
		
		FETCH cursor_examenes INTO v_id, v_titulo;
		
		IF fin THEN
			LEAVE leer_cursor;
		END IF;	
		
		Select count(id) into v_cont_examen From examen Where examen.titulo = LOWER(v_titulo);
		Select count(Id) into v_cont_exam From ExamenesCategorias Where titulo = v_titulo;
		
		IF(v_cont_examen > 1 AND  v_cont_exam = 0)THEN			
			Insert Into ExamenesCategorias(Id, Titulo) Values (v_id, v_titulo);
		END IF;					
		
	END LOOP leer_cursor;
	
	CLOSE cursor_examenes;
	
	Select Id, Titulo From ExamenesCategorias;
END