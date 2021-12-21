/* sub query */
--단일행(sub의 row 1개)
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
                
                

--다중행(sub의 row 여러개)
--in (같은 경우, or)
select  employee_id,
        first_name,
        salary
from employees
where salary in ( select salary
                  from employees
                  where department_id = 110);
                  
--예제
--각 부서별로 최고급여를 받는 사원을 출력하세요(조건2개 and 일때)
select  employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in ( select department_id,
                                          max(salary)
                                   from employees
                                   group by department_id);
      
                                                                      
--any(같은 경우 외, or)
select  first_name,
        salary
from employees
where salary > any( select salary
                    from employees
                    where department_id = 110);
     
                    
--and(같은 경우 외, and)
select  first_name,
        salary
from employees
where salary > all( select salary
                    from employees
                    where department_id = 110);
                    
                    
--조건절에서 비교 vs 테이블에서 조인
select  first_name,
        department_id,
        salary
from employees
where (department_id, salary) in ( select department_id,
                                          max(salary)
                                   from employees
                                   group by department_id);
                                   
select  e.first_name,
        e.department_id,
        e.salary
from employees e,( select department_id,
                          max(salary) salary
                   from employees
                   group by department_id) s
where e.department_id = s.department_id
and e.salary = s.salary;
