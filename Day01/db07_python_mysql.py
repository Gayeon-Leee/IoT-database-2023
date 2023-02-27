# Python에서 MYySQL 접근(연동)
import pymysql

conn = pymysql.connect(host='localhost', user='root', password='12345',
                       db='homeplus', charset='utf8')    # localhost는 자기 컴퓨터 아이피 = 127.0.0.1

cur = conn.cursor()
sql = 'SELECT * FROM membertbl'
cur.execute(sql) # 쿼리문 실행

rows = cur.fetchall()
print(rows)

conn.close()    # DB는 접속 후 반드시 닫아줘야함