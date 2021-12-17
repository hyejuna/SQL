/*단일행 함수*/

--문자함수 
--INITCAP
select  email,
        initcap (email) "Email2",
        department_id
from employees
where department_id = 100;

--lower, upper
select  first_name,
        lower(first_name),
        upper(first_name)
from employees
where department_id =100;

--substr
select  first_name,
        substr(first_name,1,3),
        substr(first_name,-3,2)
from employees
where department_id = 100;

--lpad, rpad
select  first_name,
        lpad(first_name,10,'*'),
        rpad(first_name,10,'*')
from employees;

--replace
select  first_name,
        replace(first_name, 'a', '*'),
        replace(first_name, substr(first_name,2,3), '***')
from employees
where department_id =100;



--숫자함수
--round(반올림)
select  round(123.456, 2) "r2",
        round(123.456, 0) "r0",
        round(123.456, -1) "r-1"
from dual;

--trunc
select  trunc(123.456, 2) "r2",
        trunc(123.456, 0) "r0",
        trunc(123.456, -1) "r-1"
from dual;



--날짜함수
--sysdate
select sysdate
from dual;

--months_between
select  sysdate, 
        hire_date,
        round(months_between(sysdate, hire_date),0),
        trunc(months_between(sysdate, hire_date),0)
from employees
where department_id =100;



--변환함수
-- to_char : 숫자 -> 문자
select  first_name,
        salary,
        salary*12,
        to_char(salary*12, '999999999'),
        to_char(salary*12, '000999999'),
        to_char(salary*12, '$999999'), -- 9개수로 자릿수 표현
        to_char(salary*12, '999999.99'),
        to_char(salary*12, '999,999,999')
from employees
where department_id = 100;

-- to_char : 날짜 -> 문자 (날짜가 숫자로 저장되므로 환경에 따라 포맷 다를 수 있음 -> 꼭 어떤 포맷으로 나타내야 할때는 문자로 바꿔 저장)
select  sysdate,
        to_char(sysdate, 'yy-mm-dd hh24:mi:ss'),
        to_char(sysdate, 'yy"년"mm"월"dd"일" (dy)')
from dual;

select  sysdate,
        to_char(sysdate, 'dd'),
        hire_date,
        to_char(hire_date, 'mm')
from employees;



--일반함수
--nvl, nvl2
SELECT  first_name,
        commission_pct,
        nvl(commission_pct, 0),
        nvl2(commission_pct, 100, 0)
from employees;