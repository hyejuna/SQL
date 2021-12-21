--Practice04
--문제1
select count(salary)
from employees
where salary < ( select avg(salary)
                 from employees);
                 
                 
--문제2
select  e.employee_id,
        e.first_name,
        e.salary,
        s.avgs,
        s.ms
from employees e, (select avg(salary) avgs,
                          max(salary) ms
                   from employees) s
where e.salary >= s.avgs
and e.salary <= s.ms
order by e.salary asc;


--문제3
select  location_id,
        street_address,
        postal_code,
        city,
        state_province,
        country_id
from locations
where location_id = ( select location_id
                      from departments
                      where department_id = ( select department_id
                                              from employees
                                              where first_name = 'Steven'
                                              and last_name = 'King'));
                                              
                                              
--문제4
select  employee_id,
        first_name,
        salary
from employees
where salary < any( select salary
                    from employees
                    where job_id = 'ST_MAN')
order by salary desc;
                    
                    
--문제5
--조건절 비교
select  employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;
--테이블 조인
select  e.employee_id,
        e.first_name,
        e.salary,
        e.department_id,
        s.department_id,
        s.salary
from employees e, (select department_id, max(salary) salary
                   from employees
                   group by department_id) s
where e.department_id = s.department_id
and e.salary = s.salary
order by e.salary desc;


--문제6
select  j.job_title,
        e.salary
from jobs j, ( select sum(salary) salary, job_id
               from employees
               group by job_id) e
where j.job_id = e.job_id
order by e.salary desc;


--문제7
select  e.employee_id,
        e.first_name,
        e.salary
from employees e, ( select department_id, avg(salary) salary
                    from employees
                    group by department_id) s
where e.department_id = s.department_id
and e.salary > s.salary;