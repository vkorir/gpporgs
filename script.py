import json
import mysql.connector

def migrateData():

	"""
	organization fields to be inserted
	- name, street, city, state, zipCode, region, country, phone, email, website, affiliations, type, sectors, contacts

	1. store org address  (street, city, state, zipCode, country)
	2. store org contacts (name, role, phone, email)
	3. store org details  (address_id, contact_ids, name, phone, email, website, description, affiliations, type, country, region, sectors, approved_status, average_cost=0, num_reviews=1) 

	from table: vid[11->604]

	content_field_org_name								=> gpp_details:name
	content_field_org_street							=> gpp_addresses:street
	content_field_org_city								=> gpp_addresses:city
	content_field_org_state								=> gpp_addresses:state
	content_field_org_zip			=> gpp_addresses:zipCode
	content_field_geo_region							=> gpp_details:region
	content_field_org_coutry							=> gpp_details:country
	content_field_org_phone								=> gpp_details:phone
	content_field_org_email:field_org_email_value		=> gpp_details:email
	content_field_org_web_url:field_org_web_url_value	=> gpp_details:website
		=> gpp_details:affiliations
	content_field_org_type:field_org_type_value			=> gpp_details:type
	content_field_sector:field_sector_value				=> gpp_details:sectors
		=> gpp_contacts:name1
		=> gpp_contacts:role1
		=> gpp_contacts:phone1
	content_field_contact_email1	=> gpp_contacts:email1
		=> gpp_contacts:name2
		=> gpp_contacts:role2
		=> gpp_contacts:phone2
		=> gpp_contacts:email2
		=> gpp_contacts:name3
		=> gpp_contacts:role3
		=> gpp_contacts:phone3
		=> gpp_contacts:email3
	"""

	oldDb = mysql.connector.connect(
		host='192.168.93.100',
		user='root',
		passwd='root',
		database='local',
		port='4002')

	# newDb = mysql.connector.connect(
	# 	host='192.168.93.100',
	# 	user='root',
	# 	passwd='root',
	# 	database='local',
	# 	port='4006'
	# 	)

	oldCursor = oldDb.cursor()
	# newCursor = newDb.cursor()

	# - name, street, city, state, zipCode, region, country, phone, email, website, affiliations, type, sectors, contacts

	table_names_to_fields = {
		'content_field_org_name': 'field_org_name_value',
		'content_field_org_street': 'field_org_street_value',
		'content_field_org_city': 'field_org_city_value',
		'content_field_org_state': 'field_org_state_value',
		'content_field_org_zip': 'field_org_zip_value',
		'content_field_geo_region': 'field_geo_region_value',
		'content_field_geo_country': 'field_geo_country_value',
		'content_field_org_phone': 'field_org_phone_value',
		'content_field_org_email': 'field_org_email_value',
		'content_field_org_web_url': 'field_org_web_url_value',
		# 'content_field_org_campus_affiliation': 'field_org_campus_affiliation_value',
		# 'content_field_org_type': 'field_org_type_value',
		# 'content_field_sector': 'field_sector_value'
	}

	select_ = []
	from_ = []
	where_ = []

	for table_name, field_name in table_names_to_fields.items():
		select_.append(field_name)
		from_.append(table_name)

	select_ = ','.join(select_)
	from_ = ','.join(from_)

	prev = None
	for table_name in table_names_to_fields.keys():
		if prev:
			where_.append(prev + '=' + table_name + '.vid')
		prev = table_name + '.vid'
	where_ = ' and '.join(where_)

	query = 'select ' + select_ + ' from ' + from_ + ' where ' + where_
	oldCursor.execute(query);
	record = oldCursor.fetchall()

	for item in record:
		print (item)



	# with open('data/countries.json') as json_file:
	# 	countries = json.load(json_file)
	# 	for country in countries:
	# 		query = 'INSERT INTO countries (code, name) VALUES (%s, %s)'
	# 		cursor.execute(query, (country['code'], country['name']))

	# newDb.commit()
	# print (newCursor.rowcount, 'record inserted.')


def populateTables():
	db = mysql.connector.connect(
		host='localhost',
		user='user',
		passwd='pass',
		database='gpporgs',
		port='3306')

	cursor = db.cursor()
	query = 'select * from affiliations;'
	cursor.execute(query)

	for item in cursor.fetchall():
		print (item)
