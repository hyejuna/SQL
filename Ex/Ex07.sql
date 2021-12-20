/* sub query */

select  first_name,
        salary
from employees
where salary > (select salary
                from employees 
                where first_name = 'Den');
                
--예제
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select  first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary)
                from employees);
                
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
select  first_name,
        salary
from employees
where salary < (select avg(salary)
                from employees);
