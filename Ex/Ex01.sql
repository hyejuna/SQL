/*
select 문
    select 절
    from 절
*/

--직원테이블 전체 조회
select * 
from employees;

--부서테이블 전체 조회
select * 
from departments;



--원하는 컬럼만 조회
select employee_id, 
       first_name, 
       last_name
from employees;

--)예제
select first_name,
       phone_number,
       hire_date,
       salary
from employees;

select first_name,
       last_name,
       salary,
       phone_number,
       email,
       hire_date
from employees; 



--출력할 컬럼명 별명 적용(원본 변경 없음. 무조건 대문자. 특수문자, 공백, 소문자 쓰려면 쌍따옴표)
select  employee_id as empNo,
        first_name as "f-name",
        salary as "연 봉"
from employees;

--예제
select  first_name as 이름,
        phone_number as 전화번호,
        hire_date as 입사일,
        salary as 급여
from employees;

select  employee_id 사원번호,
        first_name as 이름,
        last_name as 성,
        salary as 급여,
        phone_number as 전화번호,
        email as 이메일,
        hire_date as 입사일
from employees;



--연결 연산자(Concatenation)로 컬럼 붙이기 (삽입 문자 작은 따옴표)
select first_name || last_name
from employees;

select first_name || ' ' || last_name name
from employees;

select first_name || ' 입사일은 ' || hire_date
from employees;



--산술 연산자
select first_name,
        salary 월급, 
        salary*12 연봉,
        (salary+300)*12
from employees;

--예제 : 숫자가 아니라 사칙연산 안 됨!
select job_id*12
from employees;

select  first_name || '-' || last_name "성 명",
        salary 급여,
        salary*12 연봉,
        salary*12+5000 연봉2,
        phone_number 전화번호
from employees;



/*where절*/
--비교 연산자(조건 column도 일단 출력해서 검증 후 지우기)
--부서번호가 10인 사원의 이름
select first_name
from employees
where department_id = 10;

--예제
--급여가 5000 이상인 사원들의 이름과 월급
select  first_name,
        salary
from employees
where salary >= 5000;

--07/01/01일 이후 입사한 사원들의 이름과 입사일
select  first_name,
        hire_date
from employees
where hire_date >= '07/01/01'; -- 날짜 형식 작은따옴표 필요. 실제 저장은 숫자로 됨

--이름이 Lex인 직원의 연봉
select salary*12
from employees
where first_name = 'Lex';



-- 조건이 2개 이상
-- 연봉이 14000이상 17000이하인 사원의 이름과 연봉
select  first_name,
        salary
from employees
where salary >=14000
and salary <=17000;

--예제
--연봉이 14000이하이거나 17000이상인 사원의 이름과 연봉
select  first_name,
        salary
from employees
where salary <=14000
or salary >=17000;

--입사일이 04/01/01에서 05/12/31사이의 사원의 이름과 입사일
select  first_name, 
        hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';



-- between 연산자
--연봉이 14000이하이거나 17000이상인 사원의 이름과 연봉
select  first_name,
        salary
from employees
where salary between 14000 and 17000;
--where salary >=14000 and salary <=17000; 이거랑 같음. 경계값을 포함한 이상, 이하만 가능. between이 더 느림



--in 연산자
select  first_name,
        last_name,
        salary
from employees
where first_name in('Neena', 'Lex', 'John');
-- where first_name = 'Neena' or first_name = 'Lex' or first_name = 'John' 과 같음

--예제
--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉
select  first_name,
        salary
from employees
where salary in(2100, 3100, 4100, 5100);



-- like 연산자
select  first_name,
        last_name,
        salary
from employees
where first_name like 'L%';

--예제
--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select  first_name,
        salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select  first_name,
        salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select  first_name
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select  first_name
from employees
where first_name like '__a_';



--null (칸만 있고 아무 값도 없음. 한번도 이 칸에 무슨 값을 넣은 적 없음. 0 아님)
select  first_name, 
        salary, 
        commission_pct, 
        salary * commission_pct -- comm이 null이면 산술식값도 null
from employees
where salary between 13000 and 15000;



--is null/is not null
select  first_name, 
        salary, 
        commission_pct
from employees
where commission_pct is null; -- = null 아님!!

--예제
--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select  first_name, 
        salary, 
        commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select  first_name
from employees
where manager_id is null
and commission_pct is null;



/*order by 절 */
select  first_name,
        salary
from employees
order by salary asc, first_name desc; --급여로 먼저 정렬 후 급여 같으면 이름순 정렬

select  first_name,
        salary
from employees
where salary >= 9000
order by salary asc;

--예제
--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select  department_id, 
        salary, 
        first_name
from employees
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select  first_name,
        salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select  department_id, 
        salary, 
        last_name
from employees
order by department_id asc, salary desc;


