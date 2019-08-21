import json
import mysql.connector

"""
organization fields to be inserted
- name, street, city, state, zipcode, region, country, phone, email, website, affiliations, type, sector, contacts

1. store org address  (street, city, state, zipCode, country)
2. store org contacts (name, role, phone, email)
3. store org details  (address_id, contact_ids, name, phone, email, website, description, affiliations, type, country, region, sectors, approved_status, average_cost=0, num_reviews=1) 
"""

oldDb = mysql.connector.connect(
	host='',
	user='',
	passwd='',
	database='',
	port='')

newDb = mysql.connector.connect(
	host='192.168.93.100',
	user='root',
	passwd='root',
	database='local',
	port='4006'
	)

oldCursor = oldDb.cursor()
newCursor = newDb.cursor()



# with open('data/countries.json') as json_file:
# 	countries = json.load(json_file)
# 	for country in countries:
# 		query = 'INSERT INTO countries (code, name) VALUES (%s, %s)'
# 		cursor.execute(query, (country['code'], country['name']))

newDb.commit()
print (newCursor.rowcount, 'record inserted.')
