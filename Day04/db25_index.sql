USE tabledb;

CREATE TABLE TBL1(
	ID int NOT NULL PRIMARY KEY,
    bridge int NULL,
    contents VARCHAR(5000)
);

-- sqldb DB의 usertbl 데이터 중에서 userID, name, birthYear, addr 가져와서 tabledb의 usertbl에 넣겠다는것 
INSERT INTO tabledb.usertbl
SELECT userID, name, birthYear, addr
  FROM sqldb.usertbl;
  
SELECT * FROM usertbl WHERE name = '유기현';