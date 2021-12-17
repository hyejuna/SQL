--문제1
select count(*)
from employees
where manager_id is not null;


--문제2
select  max(salary) 최고임금,
        min(salary) 최저임금,
        max(salary) - min(salary) "최고임금 - 최저임금"
from employees;


--문제3
select to_char(max(hire_date),'yyyy"년" mm"월" dd"일"')
from employees;


--문제4
select  department_id,
        avg(salary) 평균임금,
        max(salary) 최고임금,
        min(salary) 최저임금
from employees
group by department_id
order by department_id desc;


--문제5
select  job_id,
        round(avg(salary),0) 평균임금,
        max(salary) 최고임금,
        min(salary) 최저임금
from employees
group by job_id
order by min(salary) desc, round(avg(salary),0) asc;


--문제6
select to_char(min(hire_date), 'yyyy-mm-dd day')
from employees;


--문제7
select  department_id 부서,
        round(avg(salary),0) 평균임금,
        min(salary) 최저임금,
        round(avg(salary),0) - min(salary) "평균임금 - 최저임금"        
from employees
group by department_id
order by round(avg(salary),0) - min(salary) desc;


--문제8
select  job_id,
        max(salary) - min(salary) "최고임금 - 최저임금"
from employees
group by job_id
order by max(salary) - min(salary) desc;


select hire_date
from employees;

--문제9
select  manager_id,
        round(avg(salary),0) 평균급여,
        min(salary) 최소급여,
        max(salary) 최대급여
from employees
where hire_date >= '05/01/01'
group by manager_id
having round(avg(salary),0) >= 5000; 


--문제10
select  last_name,
        hire_date,
        case when hire_date <= '02-12-31' then '창립멤버'
             when hire_date between '03-01-01' and '03-12-31' then '03년입사'
             when hire_date between '04-01-01' and '04-12-31' then '04년입사'
             else '상장이후입사'
        end "optDate"
from employees
order by hire_date asc;