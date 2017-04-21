#!"C:\Python27\python.exe"
import MySQLdb
import json
import re

print "Content-type:application/json; charset=utf-8\r\n\r\n"

db = MySQLdb.connect("localhost","root","","webservices")
cursor = db.cursor()

cursor.execute("SELECT * FROM news")
array = list(cursor.fetchall())

for i in xrange(0, len(array)):
    a1 = list(array[i])
    temp = ""
    
    j = 0
    while (j < 2):
        temp += a1[2]
        temp = re.sub("Lorem ipsum dolor sit amet", "This is real text", temp)
        j += 1
        
    a1[2] = temp
    array[i] = a1
    
print json.dumps(array)

db.close()
