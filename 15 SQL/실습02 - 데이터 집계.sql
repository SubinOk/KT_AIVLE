/*
실습02 - 데이터 집계
*/

-- 데이터베이스 연결
USE myshop2019;

    
-- Q01) 고객의 포인트 합을 조회하세요.
SELECT SUM(point) AS 포인트합
FROM customer;


-- Q02) '서울' 지역 고객의 포인트 합을 조회하세요.
SELECT SUM(point) AS 포인트합
FROM customer
WHERE city = '서울';
    

-- Q03) '서울' 지역 고객의 수를 조회하세요.
SELECT COUNT(*) AS 고객수
FROM customer
WHERE city = '서울';


-- Q04) '서울' 지역 고객의 포인트 합과 평균을 조회하세요.
SELECT SUM(point) AS 포인트합, AVG(point) AS 포인트평균
FROM customer
WHERE city = '서울';

    
-- Q05) '서울' 지역 고객의 포인트 합, 평균, 최댓값, 최솟값을 조회하세요.
SELECT SUM(point) AS 포인트합, AVG(point) AS 포인트평균, MAX(point) AS 최대포인트, MIN(point) AS 최소포인트
FROM customer
WHERE city = '서울';


-- Q06) 남녀별 고객의 수를 조회하세요.
SELECT gender, COUNT(*) AS 고객수
FROM customer
GROUP BY gender;


-- Q07) 지역별 고객의 수를 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, COUNT(*) AS 고객수
FROM customer
GROUP BY city
ORDER BY city ASC;
 
 
-- Q08) 지역별 고객의 수를 조회하세요.
--      단, 고객의 수가 10명 이상인 행만 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, COUNT(*) AS 고객수
FROM customer
GROUP BY city
HAVING COUNT(*) >= 10
ORDER BY city ASC;
    
    
-- Q09) 남녀별 포인트 합을 조회하세요.
SELECT gender, SUM(point) AS 포인트합
FROM customer
GROUP BY gender;    


-- Q10) 지역별 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, SUM(point) AS 포인트합
FROM customer
GROUP BY city
ORDER BY city ASC;    


-- Q11) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합이 1,000,000 이상인 행만 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
SELECT city, SUM(point) AS 포인트합
FROM customer
GROUP BY city
HAVING SUM(point) >= 1000000
ORDER BY SUM(point) DESC; 
   
   
-- Q12) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
SELECT city, SUM(point) AS 포인트합
FROM customer
GROUP BY city
ORDER BY SUM(point) DESC;     


-- Q13) 지역별 고객의 수, 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, COUNT(*) AS 고객수, SUM(point) AS 포인트합
FROM customer
GROUP BY city
ORDER BY city ASC; 


-- Q14) 지역별 포인트 합, 포인트 평균을 조회하세요.
--      단, 포인트가 NULL이 아닌 고객을 대상으로 하며, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, SUM(point) AS 포인트합, AVG(point) AS 포인트평균
FROM customer
WHERE point IS NOT NULL
GROUP BY city
ORDER BY city ASC; 


-- Q15) '서울', '부산', '대구' 지역 고객의 지역별, 남녀별 포인트 합과 평균을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순, 같은 지역은 성별을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, gender, SUM(point) AS 포인트합, AVG(point) AS 포인트평균
FROM customer
WHERE city IN ('서울', '부산', '대구')
GROUP BY city, gender
ORDER BY city ASC, gender ASC; 


-- Q16) 2019년 1월 주문에 대하여 고객아이디별 전체금액 합을 조회하세요.
SELECT order_id, SUM(total_due) AS 전체금액합
FROM order_header
WHERE order_date BETWEEN '20190101' AND '20190131'
GROUP BY order_id;


-- Q17) 다음 구문을 실행하여 YEAR, MONTH, DAY 함수 기능을 확인하고, 이후 쿼리문 작성 시 활용하세요.
-- 성능을 고려한다면 함수를 쿼리 내에 넣지 않는 것이 좋으나, 성능을 크게 고려하지 않는다면 함수를 쓰는 것도 좋은 방법
SELECT order_date,
	   YEAR(order_date) AS order_year, 
       MONTH(order_date) AS order_month, 
       DAY(order_date) AS order_day,
       total_due
	FROM order_header;


-- Q18) 주문연도별 전체금액 합을 조회하세요.
SELECT YEAR(order_date) AS order_year, SUM(total_due) AS 전체금액합
FROM order_header
GROUP BY YEAR(order_date);


-- Q19) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합을 조회하세요.
SELECT YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, SUM(total_due) AS 전체금액합
FROM order_header
WHERE order_date BETWEEN '20190101' AND '20190630'
GROUP BY YEAR(order_date), MONTH(order_date);


-- Q20) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합과 평균을 조회하세요.
SELECT YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, SUM(total_due) AS 전체금액합, AVG(total_due) AS 전체금액평균
FROM order_header
WHERE order_date BETWEEN '20190101' AND '20190630'
GROUP BY YEAR(order_date), MONTH(order_date); 

