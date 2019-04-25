import json
import mysql.connector

db = mysql.connector.connect(
	host='192.168.94.100',
	user='root',
	passwd='root',
	database='local',
	port='4002'
	)
cursor = db.cursor()

with open('data/countries.json') as json_file:
	countries = json.load(json_file)
	for country in countries:
		query = 'INSERT INTO countries (code, name) VALUES (%s, %s)'
		cursor.execute(query, (country['code'], country['name']))

db.commit()
print (cursor.rowcount, 'record inserted.')
