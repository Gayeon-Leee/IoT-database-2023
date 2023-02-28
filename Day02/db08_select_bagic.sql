-- Active: 1677474346466@@127.0.0.1@3306@employees
-- 사용 데이터베이스 변경
USE homeplus;

-- 한 문장 끝은 세미콜론으로 마침
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl; /*위와 완전히 같음.. 지금 homeplus 쓰고 있기 때문 */

SELECT * FROM employees.titles;	/* 지금 쓰고 있지 않은 DB에서 데이터 가져올때 이렇게 사용! */

-- 필요한 컬럼만 가져올때
SELECT first_name, last_name FROM indextbl;

-- sqldb를 사용
USE sqldb;

-- 조건절로 검색
SELECT userID
     , name
     , birthYear
     , height 
 FROM usertbl 
 WHERE name = '김경호';
 
-- 관계연산자
SELECT *
  FROM usertbl
 WHERE birthYear >= 1970
   AND height >= 182;
   
-- 사이의 값을 조회
SELECT *
  FROM usertbl
 WHERE height >= 180
   AND height <= 183;
   
SELECT *
  FROM usertbl
 WHERE height BETWEEN 180 AND 183;
 
-- IN 연산자
SELECT *
  FROM usertbl
 WHERE addr IN ('경남', '경북','전남');
 
-- 문자열 검색 -> 뉴스 본문 안에서 일정 단어 검색 등에 필요
SELECT *
  FROM usertbl
 WHERE name LIKE '김__';
 
-- Subquery 사용 위치
/*
1. 컬럼 위치
2. 테이블 위치
3. 조건절 위치
*/ 
-- WHERE절에 서브쿼리가 컬럼이 한 개 이상이거나 결과가 한 개 이상이면 조건연산자로 조회 할 수 없음 -> IN절 사용시만 가능
SELECT name
     , height
  FROM usertbl
 WHERE height IN (SELECT height FROM usertbl WHERE name LIKE '김%');
 
-- 가상 테이블
SELECT u.userID
	 , u.name
     , (2023 - u.birthYear) AS 'age'	/* AS는 별명 처럼 쓰는 것*/
  FROM (
		SELECT userID, name, birthYear, addr
          FROM usertbl
		) AS u
 WHERE u.birthYear > 1969;
 
-- 컬럼에 쓰는 서브쿼리
SELECT b.userID AS '아이디'
     , (SELECT name FROM usertbl WHERE userID = b.userID) AS '이름'
     , b.prodName
     , b.price * b.amount AS '판매액'
  FROM buytbl AS b;

-- 정렬 ORDER BY
SELECT *
  FROM usertbl
 WHERE birthYear > 1969
 ORDER BY birthYear ASC, height DESC;
 
-- 중복 제거 / 중복 제거할 컬럼만
SELECT DISTINCT addr
  FROM usertbl;
  
-- LIMIT 개수 제한
USE homeplus;

SELECT * FROM indexTBL
 LIMIT 5;
 
-- 조회하면서 새로운 테이블 생성
-- PK / FK 제약조건은 복사 안됨
-- 일부 컬럼(열)만 복사 테이블 생성 가능
USE sqlDB;
CREATE TABLE elec_buytbl_new
SELECT num
     , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자';