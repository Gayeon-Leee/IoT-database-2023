-- 집계함수 사용 => 그룹핑
USE sqldb;

-- GROUP BY에 작성된 컬럼 명만 SELECT절에 쓸 수 있음 => SELECLT * 안됨!
-- SUM(price)는 기존 컬럼이 아니라 SUM() 함수 사용해서 새롭게 만든 데이터기때문에 SELECT절 안에서 써도 결과 나오는 것
-- SUM(price) 아닌 그냥 price만 쓰면 오류 
SELECT userID AS '아이디'
	 , SUM(price) AS '구매가격'
  FROM buytbl
 GROUP BY userId;
 
 
SELECT userID AS '아이디'
	 , AVG(amount) AS '평균구매개수'
  FROM buytbl
 GROUP BY userId;
 
-- HAVING은 집계함수 등의 결과값을 필터링 하기 위해 사용
SELECT userID
	 , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
HAVING 합산 >= 1000;

-- ROLLUP 전체 합계
SELECT userID
	 , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
 WITH ROLLUP;