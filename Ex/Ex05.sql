/* join문 */

--row 개수 = em개수* dep 개수 -> 카티젼 프로덕트(cartesian product)
select  *
from employees, departments;

select  employee_id,
        first_name,
        salary,
        department_name,
        em.department_id --두 테이블에 모두 있어서 어디에 있는건지 안적어주면 오류남
from employees em, departments de --테이블 별명은 as 쓰면 안됨!(column 별명은 as 써도 되고, 안써도 됨.)
where em.department_id = de.department_id;

--예제
select  em.first_name,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id
order by em.first_name asc;