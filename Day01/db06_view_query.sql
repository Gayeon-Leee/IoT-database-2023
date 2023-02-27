-- 그냥 테이블 접근
SELECT *
	FROM memberTBL;
    
-- view 생성
CREATE VIEW uv_memberTBL
	AS
	 SELECT memberName, memberAddress
	   FROM memberTBL;
       
-- view 조회
SELECT *
  FROM uv_membertbl;