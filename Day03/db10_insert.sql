-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('YKH', '유기현', 1993, '서울', '010', '11112222', 175, '2023-03-02');

-- 컬럼 다 적을 때 입력 안할 컬럼은 NULL로 지정
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('CHW', '채형원', 1994, '전남', NULL, NULL, NULL, NULL);

-- NULL 컬럼은 생략 가능,, 실무에서는 이렇게는 잘 안씀. 밑에처럼 아예 생략하거나 위 처럼 다 씀
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('LCG', '임창균', 1996, '서울');

-- 컬럼 지정 생략 가능, 단 값의 순서가 컬럼의 순서와 일치해야 함
INSERT INTO usertbl VALUES
('SHW', '손현우', 1992, '서울', '010', '11113333', 182, NULL);


-- AUTO INCREMENT 의 경우 필드값을 입력하지 않아도 됨 => 중복 인식이 안되기 때문에 실행할 때 마다 추가됨! 주의할 것
-- 중복값 삭제하고 새 데이터 넣어도 이전 키 값 살릴 수 없음
-- EX) 14,15,16 데이터가 중복되어 지우고 새 데이터로 넣어도 키값은 14가 아닌 17로 생성되는 것
INSERT INTO buytbl
(userID, prodName, groupName, price, amount)
VALUES
('YKH', '노트북', '전자', 5000000, 1);