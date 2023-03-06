/* BookRentalShop 연습 */

SELECT *
  FROM divtbl;
  
-- 서브쿼리
SELECT b.Author AS '저자' -- 1	 
     , b.Division AS '장르' -- 2
     , b.Names AS '책제목'  -- 3
     , b.ISBN 
     , b.Price AS '금액'
  FROM bookstbl AS b
 ORDER BY 3; -- 3번인 b.Names 기준으로 정렬한다는 것 