/*
01 - 기본적인 데이터 조회
*/


-- 1) 단순 조회

/*
- SELECT 문에 FROM 절이 꼭 필요한 것은 아님
- 특정 값, 계산식 또는 함수 결과를 조회할 수 있음
- AS를 사용해 표시되는 열의 별칭을 지정할 수 있음
*/

-- 문자열 출력
SELECT 'Hello SQL World';

-- 별칭 사용
SELECT 'Hello SQL World' AS Start;

-- 숫자 연산 결과 출력
SELECT 10 + 20 AS Result;

-- 함수 결과 출력
SELECT CURDATE() AS Today;

-- 변수 값 출력
SET @Today = CURDATE();
SELECT @Today;


-- 2) 테이블의 모든 데이터 조회

/*
- 테이블의 모든 행의 모든 열을 조회
- 데이터가 많은 테이블에 대해서는 사용을 자제
*/

-- 데이터베이스 연결
USE hrdb2019;

-- 현재 데이터베이스 확인
SELECT DATABASE();

-- 직원 정보 조회
SELECT * FROM employee;

-- 부서 정보 조회
SELECT * FROM department;


-- 3) 테이블의 일부 열만 조회

/*
- SELECT 절에 일부 열을 보고 싶은 순서로 나열하여 조회
- 꼭 필요한 열을 지정해서 조회해야 함
*/

-- 원하는 열을 원하는 순서로 나열
SELECT emp_name, emp_id, gender, dept_id, phone, salary
	FROM employee;

-- 부서 정보 조회
SELECT dept_id, dept_name
	FROM department;


-- 4) 테이블의 일부 행만 조회

/*
- WHERE 절에 지정한 조건에 맞는 일부 행만 조회
- 꼭 필요한 행만 조회하도록 정확한 조건을 지정해야 함
*/

-- S0001 직원 정보 조회
SELECT *
	FROM employee
	WHERE emp_id = 'S0001';

-- MKT 부서 직원 정보 조회
SELECT *
	FROM employee
	WHERE dept_id = 'MKT';

-- S0002 휴가 정보 조회
SELECT *
	FROM vacation
	WHERE emp_id = 'S0002';
   

-- 5) 테이블의 일부 행의 일부 열만 조회

/*
- 가장 바람직한 형태, 꼭 필요한 열과 행 만을 조회하도록 함
- 열 이름이 잘못 지정되면 오류가 발생
- 조건이 잘못 지정되면 오류 대신 의도하지 않는 결과를 얻을 수 있음
- 지정한 조건에 문제가 없는지 면밀히 검토해야 함
*/

-- S0001 직원 정보 조회
SELECT emp_id, emp_name, dept_id, gender, hire_date
	FROM employee
	WHERE emp_id = 'S0001';

-- SYS 부서 정보 조회
SELECT dept_id, dept_name
	FROM department
	WHERE dept_id = 'SYS';


-- 6) 비교 연산자: =. >, <, >=, <=, <>, !=

/*
- 크기를 비교할 때 사용하는 연산자
- 대부분 WHERE 절에서 조건을 정의할 때 사용
- 정확한 조회 결과를 얻기 위해 신중하고 또 신중해야 할 부분
- 문자, 날짜, 숫자 모두 크기를 비교할 수 있음
*/

-- SYS 부서 직원 정보 조회
SELECT emp_name, emp_id, dept_id, gender, hire_date, phone
	FROM employee
	WHERE dept_id = 'SYS';

-- 연봉이 7,000을 초과하는 직원 정보 조회
SELECT emp_name, emp_id, dept_id, gender, hire_date, salary
	FROM employee
	WHERE salary > 7000;

-- 2015년 3월 이전에 입사한 직원 정보 조회
SELECT emp_name, emp_id, dept_id, gender, hire_date, phone
	FROM employee
	WHERE hire_date < '2015-03-01';

-- SYS 부서가 아닌 직원 정보 조회
SELECT emp_name, emp_id, dept_id, gender, hire_date, phone
	FROM employee
	WHERE dept_id != 'SYS';


-- Q) vacation 테이블 모든 데이터 조회
SELECT *
	FROM vacation;


-- Q) unit 테이블 모든 데이터 조회
SELECT *
	FROM unit;


-- Q) 남자 직원의 사번, 이름, 입사일 정보 조회
SELECT emp_id, emp_name, hire_date
	FROM employee
    WHERE gender = 'M';


-- Q) 2016년 6월 1일 입사자의 이름, 부서코드, 성별, 이메일 정보 조회
SELECT emp_name, dept_id, gender, email
	FROM employee
    where hire_date = '2016-06-01';
    
    
-- Q) 휴가 기간이 5일 이상인 사번, 휴가시작일, 휴가사유 정보 조회
SELECT emp_id, begin_date, reason
	FROM vacation
	WHERE duration >= 5;



-- 7) LIKE 연산자

/*
- 문자열 데이터는 숫자나 날짜와 달리 다양한 조건의 검색이 요구됨
*/

-- 김씨 성을 갖는 직원
SELECT emp_id, emp_name, dept_id, hire_date, email, phone
	FROM employee
	WHERE emp_name LIKE '김%';

-- 이름에 '국'이 들어간 직원
SELECT emp_id, emp_name, dept_id, hire_date, email, phone
	FROM employee
	WHERE emp_name LIKE '%국%';

-- 이름이 '국'으로 끝나는 직원
SELECT emp_id, emp_name, dept_id, hire_date, email, phone
	FROM employee
	WHERE emp_name LIKE '%국';

-- 이메일 아이디가 4글자인 직원

SELECT emp_id, emp_name, dept_id, hire_date, email, phone
	FROM employee
	WHERE email LIKE '____@%';
    
    
-- Q) 전화번호가 017로 시작하는 직원 정보 조회
SELECT *
	FROM employee
    where phone LIKE '017%';


-- Q) 전화번호가 010으로 시작하지 않는 직원 정보 조회
SELECT *
	FROM employee
    where phone NOT LIKE '010%';


-- 8) 논리 연산자: AND, OR, NOT 

/*
- WHERE 절에 여러 개의 조건을 연결하는 연산자
- AND는 조건을 만족할 수록 결과 행이 줄어듦(긍정적)
- OR는 조건을 만족할 수록 결과 행이 늘어남(부정적)
- NOT은 조건에 대한 부정을 의미함
- 괄호를 사용해 조건을 명확히 식별할 수 있도록 해야 함
*/

-- 2016년에 입사인 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE hire_date >= '2016-01-01' AND hire_date <= '2016-12-31';
    
-- SYS 부서 남자 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE gender = 'M' AND dept_id = 'SYS';

-- SYS, MKT, GEN 부서 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE dept_id = 'SYS' OR dept_id = 'MKT' OR dept_id = 'GEN';


-- Q) 2018년부터 입사한 SYS 부서 직원 정보 조회
SELECT emp_id, emp_name, dept_id, phone, hire_date
FROM employee
WHERE dept_id = 'SYS' AND hire_date >= '20180101';


-- Q) SYS 부서 직원 중에서 급여를 6,000 이상 받는 직원 정보 조회
SELECT emp_id, emp_name, dept_id, phone, hire_date
FROM employee
WHERE dept_id = 'SYS' AND salary >= 6000;
    
    
-- 9) 범위 조건(BETWEEN)과 리스트 조건(IN)

/*
- WHERE 절을 단순하게 표시할 수 있는 방법, 가독성 향상
- WHERE 절에 열 이름이 반복되는 문제를 해결함
- NOT을 사용해 부정 조건을 지정할 수 있음
*/

-- 2016년에 입사한 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE hire_date BETWEEN '2016-01-01' AND '2016-12-31';

-- SYS, MKT, GEN 부서 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE dept_id IN ('SYS', 'MKT', 'GEN');


-- Q) 2014년도에 입사한 정보시스템, 영업팀 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE dept_id IN ('SYS', 'MKT');


-- Q) 2015년도에 입사한 연봉이 6,000 이상인 근무중인 직원 정보 조회
SELECT emp_id, emp_name, dept_id, phone, hire_date
	FROM employee
	WHERE hire_date BETWEEN '20150101' AND '20151231'
		AND salary >= 6000 
		AND retire_date IS NULL;


-- Q) 홍길동(S0001), 강우동(S0003), 오삼식(S0005)의 2015년 휴가 정보 조회
SELECT emp_id, begin_date, end_date, reason, duration
	FROM vacation
	WHERE emp_id IN ('S0001','S0003','S0005')
		AND begin_date >= '20150101'
		AND end_date <= '20151231';


-- 10) NULL 값

/*
- NULL 값은 0도 아니고 공백도 아닌 알 수 없는 값(Unknown Value)
- 홍길동 몸무게가 NULL, 일지매 몸무게가 NULL이면
  홍길동과 일지매는 몸무게가 0인가?
  홍길동과 일지매 몸무게가 같나? 
- NULL 값과 'NULL'은 완전 다름
- IS NULL, IS NOT NULL을 사용해 NULL 값을 식별할 수 있음
*/

-- 근무 중인 직원 정보 조회 (?)
SELECT emp_name, emp_id, gender, dept_id, hire_date, phone
	FROM employee
	WHERE retire_date = 'NULL';

-- 근무 중인 직원 정보 조회 (?)
SELECT emp_name, emp_id, gender, dept_id, hire_date, phone
	FROM employee
	WHERE retire_date = NULL;

-- 근무 중인 직원 정보 조회 (!)
SELECT emp_name, emp_id, gender, dept_id, hire_date, phone
	FROM employee
	WHERE retire_date IS NULL;
    
-- 퇴사한 직원 정보 조회
SELECT emp_name, emp_id, gender, dept_id, hire_date, phone
	FROM employee
	WHERE retire_date IS NOT NULL;

-- IFNULL 함수 사용 전
SELECT emp_name, emp_id, eng_name, gender, dept_id, hire_date, phone
	FROM employee
	WHERE retire_date IS NULL;

-- IFNULL 함수 사용: eng_name 열 값이 NULL이면 공백 표시
SELECT emp_name, emp_id, IFNULL(eng_name, ''), gender, dept_id, hire_date, phone
	FROM employee
	WHERE retire_date IS NULL;

-- IFNULL 함수 결과에 별칭 사용
SELECT emp_name, emp_id, IFNULL(eng_name, '') AS 'nick_name', gender, dept_id, hire_date
	FROM employee
	WHERE retire_date IS NULL;

/*
참고: DBMS마다 다른 NULL 처리 함수
-- MySQL, SQLite: IFNULL()
-- MSSQL: ISNULL()
-- ORACLE: NVL()
*/

-- COALESCE() 함수 사용
SELECT emp_name, emp_id, COALESCE(eng_name, '') AS 'nick_name', gender, dept_id, hire_date
	FROM employee
	WHERE retire_date IS NULL;


-- Q) 본부에 속하지 않은 부서 정보 조회
SELECT dept_id, dept_name
	FROM department
    WHERE unit_id is NULL;


-- Q) 영어 이름이 없는 근무중인 직원 정보 조회
SELECT *
	FROM employee
	WHERE eng_name IS NULL;


-- 11) 데이터 결합

/*
- CONCAT 함수를 사용해 데이터 결합
- 결합되는 값에 NULL 값이 포함되면 결합 결과가 NULL이 됨
*/

-- 자동 형 변환(SQLite도 동일)
SELECT '10' + '20'; -- 30
SELECT 10 + '20';  -- 30
SELECT 10 + '20AX'; -- 30
SELECT 10 + 'LX20'; -- 0
SELECT 'A' + 'B'; -- 0

-- 문자열 데이터 결합(SQLite는 지원하지 않음)
SELECT CONCAT('10', '20'); -- 1020
SELECT CONCAT(10, '20'); -- 1020
SELECT CONCAT(10, 20); -- 1020
SELECT CONCAT(10, NULL); -- NULL

/*
(SQLite version)
SELECT '10' || '20'; -- 1020
SELECT 10 || '20';  -- 1020
SELECT 10 || 20 || 30; -- 102030
*/

-- 열 데이터 결합
SELECT CONCAT(emp_name, '(', emp_id, ')') AS emp_name, dept_id, gender, hire_date, email
	FROM employee
	WHERE retire_date IS NULL;

-- 문자와 숫자 결합
SELECT CONCAT(emp_name, '(', salary, ')') AS emp_name, dept_id, gender, hire_date, email
	FROM employee
	WHERE retire_date IS NULL;

-- 문자와 날짜 결합
SELECT CONCAT(emp_name, '(', hire_date, ')') AS emp_name, dept_id, gender, hire_date, email
	FROM employee
	WHERE retire_date IS NULL;

-- NULL과 결합하면?
SELECT CONCAT(emp_name, '(', eng_name, ')') AS emp_name, dept_id, gender, hire_date, email
	FROM employee
	WHERE retire_date IS NULL;

-- NULL 값 처리 #1
SELECT CONCAT(emp_name, '(', IFNULL(eng_name, ''), ')') AS emp_name, dept_id, gender, 
       hire_date, email
	FROM employee
	WHERE retire_date IS NULL;

-- NULL 값 처리 #2
SELECT CONCAT(emp_name, IFNULL(CONCAT('(', eng_name, ')'), '')) AS emp_name, dept_id, gender, 
       hire_date, email
	FROM employee
	WHERE retire_date IS NULL;


-- Q) 사원번호와 부서코드를 묶어서(예: S0001(SYS)) 근무중인 직원 정보 조회
SELECT emp_name, CONCAT(emp_id, '(', dept_id, ')') AS emp_id, gender, hire_date, email
	FROM employee
    WHERE retire_date IS NULL;
    
    
-- 12) 데이터 정렬

/*
- ORDER BY 절을 사용해 정렬된 결과를 표시할 수 있음
- 꼭 필요한 경우만 데이터 정렬을 사용(성능 문제 발생 가능)
- ASC: 오름차순  --> 1, 2, 3, 4 / 가, 나, 다, 라 / A, B, C, D
- DESC: 내림차순 --> 4, 3, 2, 1 / 라, 다, 나, 가 / D, C, B, A
- 정렬 방식을 생략하면 ASC가 지정된 것으로 간주됨
- 문자, 날짜, 숫자 모두 정렬 가능
- 복합 정렬은 콤마(,)로 구분해서 정렬 방식을 지정함
*/

-- 이름을 기준으로 오름차순 정렬
SELECT emp_name, emp_id, gender, dept_id, hire_date, phone
	FROM employee
	WHERE retire_date IS NULL
	ORDER BY emp_name ASC;

-- 이름을 기준으로 내림차순 정렬
SELECT emp_name, emp_id, gender, dept_id, hire_date, phone
	FROM employee
	WHERE retire_date IS NULL
	ORDER BY emp_name DESC;

-- 부서코드를 기준으로 오름차순, 이름을 기준으로 내림차순 정렬
SELECT dept_id, emp_name, emp_id, gender, hire_date, phone
	FROM employee
	WHERE retire_date IS NULL
	ORDER BY dept_id ASC, emp_name DESC;


-- Q) 연봉이 높은 순으로 정렬해서 근무중인 직원 정보 조회
SELECT dept_id, emp_name, salary, emp_id, gender, hire_date
	FROM employee
    WHERE retire_date IS NULL
    ORDER BY salary DESC;
    
    
-- 13) CASE 문

/*
- 쿼리문 안에서 조건에 따라 다른 값을 표시할 수 있음
*/

-- 직원 정보 조회
SELECT emp_name, emp_id, gender, hire_date, salary
	FROM employee;

-- 성별: M, F --> 남자, 여자
SELECT emp_name, emp_id, 
       CASE WHEN gender = 'M' THEN '남자'
            WHEN gender = 'F' THEN '여자'
            ELSE '' END AS gender, 
	   hire_date, retire_date, salary
	FROM employee;

-- 근무 상태를 근무, 퇴사로 표시
SELECT emp_name, emp_id, gender, hire_date, salary,
       CASE WHEN retire_date IS NULL THEN '근무'
            ELSE '퇴사' END AS status
	FROM employee;


-- Q) 급여 크기를 상, 중, 하로 구분
SELECT emp_name, emp_id, gender, hire_date, salary,
	CASE WHEN salary > 6000 THEN '상'
		 WHEN salary >= 5000 THEN '중'
         ELSE '하' END AS salary_level
	FROM employee;


-- 14) IF 함수

/*
- IF(조건, 참일 때 값, 거짓일 때 값)
- 주어진 조건이 참인지 거짓인지에 따라 값을 선택
- 조건 하나에 따른 값 선택의 경우 CASE 문보다 사용이 용이
*/

-- 성별: M, F --> 남자, 여자
SELECT emp_name, emp_id, 
       IF(gender = 'M', '남자', '여자') AS gender, 
	   hire_date, retire_date, salary
	FROM employee;

-- 근무 상태를 근무, 퇴사로 표시
SELECT emp_name, emp_id, gender, hire_date, salary,
       IF(retire_date IS NULL,  '근무', '퇴사') AS status
	FROM employee;


-- Q) 급여 크기를 상, 중, 하로 구분
SELECT emp_name, emp_id, gender, hire_date, salary,
	IF(salary > 6000, '상', IF(salary >= 5000, '중', '하')) AS salary_level
	FROM employee;



