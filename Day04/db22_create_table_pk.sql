CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name  VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr VARCHAR(10)
);


CREATE TABLE buytbl (
	num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName VARCHAR(10) NOT NULL,
    price INT,
    FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

-- 실무에 근접한 PK 방법
CREATE TABLE prodtbl(
	prodCode CHAR(3) NOT NULL,
    prodId CHAR(4) NOT NULL,
    prodDate DATETIME NOT NULL,
    prodCur VARCHAR(10) NULL,
    CONSTRAINT pk_prodtbl_prodCode_prodId -- 핵심!
		PRIMARY KEY (prodCode, prodId)
);

-- 멤버테이블
CREATE TABLE membertbl(
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    email VARCHAR(50) NULL UNIQUE -- UNIQUE 제약조건
);


CREATE TABLE stdtbl(
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10),
    grade INT CHECK (grade >= 1 AND grade <= 4), -- 학년은 1~4
    CONSTRAINT CK_Name CHECK ( name IS NOT NULL) -- NOT NULL
);