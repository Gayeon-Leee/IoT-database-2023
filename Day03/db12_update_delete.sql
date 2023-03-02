-- UPDATE & TRANSACTION
START TRANSACTION;

-- 경고! UPDATE 구문에는 WHERE절 빼면 안됨 => WHERE절(조건) 이 없으면 전체 데이터가 다 UPDATE 됨
UPDATE usertbl_bak
   SET mobile1 = '010'
	 , mobile2 = '22223333'
     , addr = '서울'
WHERE userID = 'YKH';
   
COMMIT;
ROLLBACK;


-- DELETE
-- WHERE절 빠지면 절대,,안됨,, 다 날아간다!
DELETE FROM usertbl
  WHERE userID = 'SHW';