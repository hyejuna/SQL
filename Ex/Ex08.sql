/*rownum*/
--한줄씩 읽어올 때 rownum 생성. 1번 번호 매김 , 2번 번호매김 -> where절 만족 x -> 다음줄에 다시 2번 -> where절에 만족하는거만으로 rownum 만듬!!
select  rownum,
        first_name,
        salary
from employees
where salary > 10000;

--급여순 정렬 -> rownum 섞임. rownum 생성 후(where절 만족하는 임시 table 생성시 rownum 생성) 정렬되는거라서...
select  rownum,
        first_name,
        salary
from employees
where rownum >= 1
and rownum <=5
order by salary desc;

--정렬된 table 불러옴 -> 불러올때 rownum 생성
select  rownum,
        first_name,
        salary
from (select first_name, 
             salary
      from employees
      order by salary desc)
where rownum <= 5;

-- 3등 ~ 5등 --> 안나옴 : where절을 통과해야 rownum이 남아있으므로...이거는 계속 rownum=1
select  rownum,
        first_name,
        salary
from (select first_name, 
             salary
      from employees
      order by salary desc)
where rownum >= 3
and rownum <= 5;

-- 정렬table -> rownum 부여 table -> where절로 원하는 등수 불러옴
select  rno,
        first_name,
        salary
from (select  rownum rno,
              first_name,
              salary
      from (select first_name, 
                   salary
            from employees
            order by salary desc))
where rno >=3
and rno <=5;

-- (1) 정렬 -> (2) rownum 생성 -> (3) where 절 사용


--예제
--07년에 입사한 직원중 급여가 많은 순으로 3~7등의 이름, 급여, 입사일
select  first_name,
        salary,
        hire_date
from (select  rownum rn,
              first_name,
              salary,
              hire_date
      from (select  first_name,
                    salary,
                    hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc))
where rn >= 3
and rn <=7;

--07년에 입사한 직원중 급여가 많은 순으로 3~7등의 이름, 급여, 입사일 + 부서명
select  r.rn,
        r.first_name,
        r.salary,
        r.hire_date,
        r.department_name
from (select  rownum rn,
              ot.first_name,
              ot.salary,
              ot.hire_date,
              ot.department_name
      from (select  e.first_name,
                    e.salary,
                    e.hire_date,
                    d.department_name
            from employees e, departments d
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            and e.department_id = d.department_id
            order by salary desc)ot) r
where r.rn >= 3
and r.rn <=7
 ;