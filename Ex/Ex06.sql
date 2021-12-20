/*join*/

--equi join
select  em.first_name,
        em.salary,
        de.department_id,
        de.department_name
from employees em, departments de
where em.department_id = de.department_id;

select count(*)
from employees em, departments de
where em.department_id = de.department_id;

--예)
select  em.first_name,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id;



--outer join
--left outer join
-- , -> left outer join // where -> on
select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;

select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em, departments de
where em.department_id = de.department_id(+); --> 위랑 같은데 oracle에서만 가능한 문법. 더 편리함.



--right outer join
select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em right outer join departments de
on em.department_id = de.department_id;

select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em, departments de
where em.department_id(+) = de.department_id;

--right outer join --> left outer join
select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from departments de, employees em
where de.department_id = em.department_id(+);



--full outer join(오라클 전용 문법 없음)
select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em full outer join departments de
on em.department_id = de.department_id;



--self join : alias(별명) 꼭 필요!
select  em.employee_id,
        em.first_name,
        em.phone_number,
        em.salary,
        em.manager_id,
        ma.employee_id,
        ma.first_name,
        ma.phone_number,
        ma.email
from employees em, employees ma
where em.manager_id = ma.employee_id;

--잘못된 join(의미 안맞는데 값 같은 것끼리 join)
select  em.employee_id,
        em.first_name,
        em.salary,
        lo.location_id,
        lo.city
from employees em, locations lo
where em.salary = lo.location_id;

