INSERT INTO proctbl (total_name)
VALUES ('CHW');

SELECT * FROM proctbl;

DELETE FROM proctbl WHERE ID = 3;

-- 완전초기화 => 완전초기화 없이 데이터만 지우면 키값은 그대로 4부터 시작함 
-- 완전초기화로 모두 지우고 데이터 추가하면 키값 1부터 다시 시작
TRUNCATE proctbl;