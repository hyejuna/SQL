/*그룹함수*/

--avg
select round(avg(salary),0)
from employees;

--오류 발생 : first_name은 107개, avg는 1개라
select first_name, avg(salary) 
from employees;

select  count(*),
        sum(salary),
        avg(nvl(salary,0)) --디폴트는 null은 평균 구할 때 제외.
from employees;



--count
select  count(*), --row 개수
        count(commission_pct), --null 제외
        count(department_id)
from employees;

select count(*)
from employees
where salary > 16000;

--부서번호 100번인 사람 수
select count(*)
from employees
where department_id = 100;



--sum
select sum(salary), count(*), avg(salary)
from employees;

select sum(salary), count(*), avg(salary)
from employees
where salary > 16000;



--max, min
select  count(*),
        max(salary),
        min(salary)
from employees;



/* group by 절 */
select avg(salary), department_id
from employees
group by department_id;
