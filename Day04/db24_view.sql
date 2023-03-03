CREATE VIEW uv_usertbl
AS
	SELECT u.userID
		 , u.name
         , u.birthYear
         , u.addr
      FROM usertbl AS u;

INSERT INTO uv_usertbl VALUES
	('ljh', '이주헌', '1994', '대구');
      
SELECT *
  FROM uv_ptentialUser;
  
INSERT INTO uv_ptentialUser VALUES
('ljh', '이주헌', 1994, '대구', '010', '89898989',
180, '2023-01-01');