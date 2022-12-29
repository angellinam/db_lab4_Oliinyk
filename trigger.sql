-- тригер для записування значення поля у верхньому регістрі при додаванні нового рядка в таблицю

CREATE OR REPLACE FUNCTION upper_case() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
	 UPDATE jobs
	 SET job_title = UPPER(job_title)
         where jobs.job_id = new.job_id;
         RETURN NULL;
     END;
$$;

CREATE TRIGGER uppercase
AFTER INSERT ON jobs
FOR EACH ROW EXECUTE FUNCTION upper_case()

