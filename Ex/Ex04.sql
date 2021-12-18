/*group by 절*/

select department_id, avg(salary)
from employees
group by department_id
order by department_id asc; --이거 오래 걸림. 필요 없을 경우 확인 위해 정렬하고 최종에서는 빼기.

select department_id, job_id, count(*), avg(salary)
from employees
group by department_id, job_id
order by department_id asc, avg(salary) asc;

select department_id, count(*), sum(salary)
from employees
-- where sum(salary) >= 20000 -> 오류: where 절 group 함수 사용 불가.
group by department_id;



--having 절(group 함수 전용 where 절)
select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and department_id = 100;



--case ~ end 문
select  employee_id,
        first_name,
        salary,
        job_id,
        case when job_id = 'AC_ACCOUNT' then salary + salary*0.1
             when job_id = 'SA_REP' then salary + salary*0.2
             when job_id = 'ST_CLERK' then salary + salary*0.3
             else salary
        end realSalary
from employees;



--decode 함수(case ~ end 문 대신 사용 가능)
select  employee_id,
        first_name,
        salary,
        job_id,
        decode( job_id, 'AC_ACCOUNT', salary + salary*0.1,
                        'SA_REP', salary + salary*0.2,
                        'ST_CLERK', salary + salary*0.3,
                salary) realSalary
from employees;

--예제
select  first_name,
        department_id,
        case when department_id between 10 and 50 then 'A-TEAM'
             when department_id between 60 and 100 then 'B-TEAM'
             when department_id between 110 and 150 then 'C-TEAM'
             else '팀 없음'
             end team
from employees;

/*  decode는 조건식 넣을 수 없음. ==일때만 가능.
select  first_name,
        department_id,
        decode( department_id, between 10 and 50, 'A-TEAM',
                               between 60 and 100, 'B-TEAM',
                               between 110 and 150, 'C-TEAM',
                '팀 없음') team
from employees;
*/