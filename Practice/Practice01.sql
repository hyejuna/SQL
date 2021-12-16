--문제1
select  first_name || ' ' || last_name 이름,
        salary 월급,
        phone_number 전화번호,
        hire_date 입사일
from employees
order by hire_date asc;


--문제2
select  job_title 업무이름,
        max_salary 최고월급
from jobs
order by max_salary desc;


--문제3
select  last_name 이름,
        manager_id "매니저 아이디",
        commission_pct "커미션 비율",
        salary 월급
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;


--문제4
select  job_title 업무이름,
        max_salary 최고월급
from jobs
where max_salary >=10000
order by max_salary desc;


--문제5
select  first_name 이름,
        salary 월급,
        nvl(commission_pct,0) 커미션퍼센트
from employees
where salary <14000
and salary >=10000
order by salary desc;


--문제6
select  last_name 이름,
        salary 월급,
        to_char(hire_date, 'yyyy-mm') 입사일,
        department_id 부서번호
from employees
where department_id in (10, 90, 100);


--문제7
select  first_name 이름,
        salary 월급
from employees
where first_name like '%S%'
or first_name like '%s%';


--문제8
select department_name 부서이름
from departments
order by length(department_name) desc;


--문제9
select upper(country_name) 나라이름
from countries
order by country_name asc;


--문제10
select  last_name 이름,
        salary 월급,
        replace(phone_number,'.','-') "전화 번호",
        hire_date 입사일
from employees
where hire_date <= '03/12/31'