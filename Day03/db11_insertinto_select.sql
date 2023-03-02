-- INSERT INTO SELECT
-- usertbl에서 앞의 네개 커럼 값을 가져와서 전부 usertbl_bak 에 넣는다는 것
INSERT INTO usertbl_bak (userID, name, birthYear, addr)
SELECT userID, name, birthYear, addr FROM usertbl;
