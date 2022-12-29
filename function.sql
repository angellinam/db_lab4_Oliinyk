-- функція для виведення назв робіт відповідно до рівнів досвіду (які задані в аргументі) та зарплати (які повинні перевищувати вказану в аргументі зарплату). 
-- виводиться також і відповідний рівень досвіду та зарплата

DROP FUNCTION IF EXISTS get_jobs(varchar, int);

CREATE OR REPLACE FUNCTION get_jobs(exp_arg varchar, salary_arg int) 
    RETURNS TABLE (jobs_title varchar, experience varchar, salary int)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        select job_title::varchar, exp_id::varchar, salary_usd::int
		from jobs inner join salaries
		on salaries.job_id = jobs.job_id
		where exp_id = exp_arg and salary_usd > salary_arg;
END;
$$
