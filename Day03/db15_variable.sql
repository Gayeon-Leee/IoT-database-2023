-- 변수 사용
USE sqldb;

SET @myVar1 = 5;
SELECT @myVar1;
SET @myVar2 = '이름 ==> ';

SELECT @myVar2, name
  FROM usertbl
 WHERE height > 170;
 

SELECT name, height + @myVar1
  FROM usertbl;
  
-- 형변환 // CAST, CONVERT 결과 완전히 같음! 편한거 사용하면 됨
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CONVERT(birthYear, CHAR) FROM usertbl;
SELECT CAST(CONVERT(birthYear, CHAR) AS SIGNED INT) FROM usertbl;  -- 바꾼거 다시 바꿀 수 있음

-- 임시적 형변환
SELECT 200 + 300; -- MySQL 이외에서는 '200300'으로 나옴

SELECT CONCAT(200, '300'); -- 문자열 합치기

-- TRUE/FALSE
SELECT 2 = 1;


/* 내장함수 리스트 */
-- 흐름함수
SELECT IF(100>200, '참', '거짓');

SELECT IFNULL(NULL, 'NULL입니다');
SELECT IFNULL(NULL, 0) + 100; -- NULL은 계산 오류 남(결과도 NULL) => NULL 을 0으로 바꿔줘야 100이라는 결과 나오는 것alter

-- NULLIF : 값이 같으면 NULL, 다르면 앞의 값 출력 ,, 많이 사용 안함
SELECT NULLIF(100,100);

-- 쿼리 작성시 많이 사용
SELECT name
	 , birthYear
     , addr
     , CASE addr
       WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       ELSE '지역권' END AS '권역'  -- 컬럼명 AS로 지정해주는 것 중요
  FROM usertbl;
  
-- 문자열 함수
SELECT ASCII('A'), CHAR(65), ASCII('a'); 
SELECT ASCII('유'); -- 한글은 사용하면 안됨

-- CHAR_LENGTH : 글자 길이 LENGTH : Byte
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다'); -- UTF-8에서 한글은 한 글자당 3Bytes

SELECT REPLACE('Hello World', 'Hello', 'Byebye');
SELECT INSTR('안녕하세요, 여러분', '여'); -- 보통 인덱스는 0부터 시작하지만, 데이터베이스는 1부터 시작

-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3), RIGHT('ABCDEFGHIJKLMN', 3);

-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          Hello World!          ') AS 'ltrim'
	 , RTRIM('          Hello World!          ') AS 'rtrim'
	 , TRIM('          Hello World!          ') AS 'trim';
     
-- 'Hello' * 3
SELECT REPEAT('Hello', 3);

-- SUBSTRING
SELECT SUBSTRING('대한민국만세', 5, 2);

-- 수학함수
SELECT ABS(-10);

SELECT CEILING(4.3), FLOOR(4.9), ROUND(4.5); -- 올림, 내림, 반올림

SELECT MOD(157, 10);

-- RANDOM
SELECT RAND(), FLOOR(1 + (RAND() * 6)); -- RAND는 0부터 1까지 소수점 나옴.. 뒤에 FLOOR 로 하면 주사위처럼 1부터 6까지 랜덤수 출력

-- 날짜 및 시간 함수
SELECT NOW();
SELECT ADDDATE('2023-03-02', INTERVAL 10 DAY);

SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DATE(NOW());
SELECT TIME(NOW());
SELECT DAYOFWEEK(NOW()); -- 1(일) ~ 7(토)
SELECT LAST_DAY('2020-02-01');

-- 시스템 함수
SELECT USER();
SELECT DATABASE();

-- ROW_COUNT()
USE sqldb;
UPDATE buytbl SET price = price * 2;
SELECT ROW_COUNT();


SELECT VERSION();
