-- 쇼핑몰에 가입하고 물건 한 번도 구매하지 않은 회원까지 모두 출력
SELECT u.*
     , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM usertbl AS u
  LEFT OUTER JOIN buytbl AS b
    ON u.userID = b.userID
 WHERE b.userID IS NULL; -- 물건 구매하지 않은 회원만 출력 
 
 -- 학생 중에 동아리에 가입하지 않은 학생 
SELECT s.stdName, s.addr
     , j.num, c.clubName, c.roomNo
  FROM stdtbl AS s
  LEFT OUTER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
  LEFT OUTER JOIN clubtbl AS c  
    ON c.clubName = j.clubName
 UNION  -- 집합(두 쿼리 결과를 합쳐줌/중복데이터는 제거) // UNION ALL 은 중복데이터까지 모두 출력 
SELECT s.stdName, s.addr
     , j.num, c.clubName, c.roomNo
  FROM stdtbl AS s
  LEFT OUTER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
 RIGHT OUTER JOIN clubtbl AS c  
    ON c.clubName = j.clubName;
    
/*    
SELECT s.stdName, s.addr, c.clubName, c.roomNo
  FROM stdtbl AS s JOIN stdclubtbl AS j -- OUTER JOIN은 JOIN 글자 위치 기준으로 왼쪽(LEFT) / 오른쪽 (RIGHT) 테이블로 분류
    ON s.stdName = j.stdName
 INNER JOIN clubtbl AS c
    ON c.clubName = j.clubName;
    
** LEFT OUTER JOIN은 왼쪽 테이블이 기준, 왼쪽 테이블의 모든 것이 출력되어야 함
   RIGHT OUTER JOIN은 오른쪽 테이블이 기준, 오른쪽 테이블의 모든 것이 출력되어야 함

*/    


-- IN 은 조건이 만족하는 것
-- NOT IN은 조건이 만족하지 않는 것 출력
SELECT name
     , height
  FROM usertbl
 WHERE height IN (SELECT height
				  FROM usertbl
				  WHERE name LIKE '유기현');