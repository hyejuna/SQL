/*Practice05*/
--문제1
select  first_name,
        manager_id,
        commission_pct,
        salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;


--문제2
select  employee_id,
        first_name,
        salary,
        to_char(hire_date,'yyyy-mm-dd'),
        replace(phone_number,'.','-'),
        department_id
from employees
where (department_id, salary) in ( select department_id, max(salary)
                                   from employees
                                   group by department_id)
order by salary desc;


--문제3
select  e.manager_id,
        m.first_name,
        e.avgsalary,
        e.minsalary,
        e.maxsalary
from employees m, ( select  manager_id,
                            round(avg(salary),0) avgSalary,
                            min(salary) minSalary,
                            max(salary) maxSalary
                    from employees
                    where hire_date > '05/01/01'
                    group by manager_id
                    having avg(salary) >= 5000) e
where m.employee_id = e.manager_id
order by avgSalary desc;


--문제4
select  e.employee_id,
        e.first_name,
        d.department_name,
        m.first_name
from employees e, employees m, departments d
where e.manager_id = m.employee_id
and e.department_id = d.department_id(+);


--문제5
select  ort.employee_id,
        ort.first_name,
        ort.department_name,
        ort.salary,
        ort.hire_date
from ( select rownum rn,
              ot.employee_id,
              ot.first_name,
              ot.department_name,
              ot.salary,
              ot.hire_date
       from( select e.employee_id,
                    e.first_name,
                    d.department_name,
                    e.salary,
                    e.hire_date
             from employees e, departments d
             where e.hire_date >= '2005/01/01'
             and e.department_id = d.department_id
             order by e.hire_date asc )ot )ort
where ort.rn >= 11
and ort.rn <= 20;


--문제6
select  e.first_name || ' ' || e.last_name,
        e.salary,
        d.department_name,
        e.hire_date
from employees e, departments d
where hire_date = ( select max(hire_date)
                 from employees)
and e.department_id = d.department_id;


--문제7
select  e.employee_id 사번,
        e.first_name 이름,
        e.last_name 성,
        e.salary 급여,
        maxDep.avgSal avg_salary,
        j.job_title        
from employees e, jobs j,
     (select department_id, 
             avg(salary) avgSal
      from employees
      group by department_id
      having avg(salary) = (select max(avg(salary))
                            from employees
                            group by department_id)) maxDep
where e.department_id = maxdep.department_id
and e.job_id = j.job_id;


--문제8
select  d.department_name       
from departments d,
     (select department_id, 
             avg(salary) avgSal
      from employees
      group by department_id
      having avg(salary) = (select max(avg(salary))
                            from employees
                            group by department_id)) maxDep
where d.department_id = maxdep.department_id;


--문제9
select ort.region_name
from ( select  rownum rn,
               ot.region_name,
               ot.avgsal
       from (select  avg(e.salary) avgSal,
                     r.region_name
             from employees e, departments d, locations l, countries c, regions r
             where e.department_id = d.department_id
             and d.location_id = l.location_id
             and l.country_id = c.country_id
             and c.region_id = r.region_id
             group by r.region_name
             order by avg(e.salary) desc ) ot)ort
where rn = 1;


--문제10
select ort.job_title
from(select  rownum rn,
             ot.job_title,
             ot.avgsal
     from (select j.job_title, 
                  avg(e.salary) avgSal
           from employees e, jobs j
           where e.job_id = j.job_id
           group by j.job_title
           order by avg(e.salary) desc) ot) ort
where rn = 1;