-- OUTER JOIN
INSERT INTO stdtbl VALUES
('유기현','서울'),('이주헌','대구'),('채형원','광주'),
('이민혁','경기'),('임창균','서울');

INSERT INTO clubtbl VALUES
('수영','101호'),('바둑','102호'),('축구','103호'),
('봉사','104호');

INSERT INTO stdclubtbl (stdName, clubName) VALUES
('유기현','바둑'),('유기현','축구'),('채형원','축구'),
('이민혁','축구'),('이민혁','봉사'),('임창균','봉사');