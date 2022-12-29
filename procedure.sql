--процедура яка надає повну назву рівня досвіду, вказаного в аргументі

CREATE OR REPLACE PROCEDURE get_experience(exp_arg varchar(50))
LANGUAGE 'plpgsql'
AS $$
DECLARE record_exp  experiencelevels.exp_id%TYPE;
DECLARE record_level experiencelevels.exp_lvl%TYPE;

BEGIN
    SELECT exp_id, exp_lvl into record_exp, record_level 
    FROM experiencelevels WHERE exp_id = exp_arg;
	
    RAISE INFO 'Experience abbreviation: %,  Experience full name: %', TRIM(record_exp), TRIM(record_level);
END;
$$;
