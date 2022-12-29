-- виклик процедури
select * from experiencelevels

CALL get_experience('EN');
CALL get_experience('MI');
CALL get_experience('SE');


-- виклик функції
select * from salaries

select * from get_jobs('MI', '50000')
select * from get_jobs('EN', '40000')


-- виклик тригера
select * from jobs

insert into jobs(job_title)
values('database developer')
