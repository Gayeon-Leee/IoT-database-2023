-- 피벗 

CREATE TABLE pivotTest
(
	uName CHAR(3),
    season CHAR(2),
    amount INT
);

INSERT INTO sqldb.pivottest
(uName, season, amount)
VALUES
('유기현','겨울',10),('이민혁','여름',15),('유기현','가을',25),
('유기현','봄',3),('유기현','봄',37),('이민혁','겨울',40),
('유기현','여름',14),('유기현','겨울',22),('이민혁','여름',64);

-- 피벗 기능
SELECT uName
	 , SUM(IF(season='봄', amount, 0)) AS '봄'
     , SUM(IF(season='여름', amount, 0)) AS '여름'
     , SUM(IF(season='가을', amount, 0)) AS '가을'
     , SUM(IF(season='겨울', amount, 0)) AS '겨울'
     , SUM(amount) as '합계'
  FROM pivottest
  GROUP BY uName