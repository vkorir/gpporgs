import csv
import json
import mysql.connector

db = mysql.connector.connect(
	host='127.0.0.1',
	user='rarudev',
	password='Rr8&RevGPPwebbz',
	database='rateandreview_prod',
	port='3306')

cursor = db.cursor()

table_names_to_fields = {											# indices
	'content_field_org_name': 'field_org_name_value',				# 0
	'content_field_org_street': 'field_org_street_value',			# 1
	'content_field_org_city': 'field_org_city_value',				# 2
	'content_field_org_state': 'field_org_state_value',				# 3
	'content_field_org_zip': 'field_org_zip_value',					# 4
	'content_field_geo_region': 'field_geo_region_value',			# 5
	'content_field_org_country': 'field_org_country_value',			# 6
	'content_field_org_phone': 'field_org_phone_value',				# 7
	'content_field_org_email': 'field_org_email_value',				# 8
	'content_field_org_web_url': 'field_org_web_url_value',			# 9
	'content_field_org_type': 'field_org_type_value',				# 10
	'content_field_org_approved': 'field_org_approved_value',		# 11
	'content_field_org_contact': 'field_org_contact_value',			# 12
	'content_field_contact_name1': 'field_contact_name1_value',		# 13
	'content_field_contact_name2': 'field_contact_name2_value',		# 14
	'content_field_contact_name3': 'field_contact_name3_value',		# 15
	'content_field_contact_role1': 'field_contact_role1_value',		# 16
	'content_field_contact_role2': 'field_contact_role2_value',		# 17
	'content_field_contact_role3': 'field_contact_role3_value',		# 18
	'content_field_contact_email1': 'field_contact_email1_value',	# 19
	'content_field_contact_email2': 'field_contact_email2_value',	# 20
	'content_field_contact_email3': 'field_contact_email3_value'	# 21
}

fields_ = []
tables_ = []

for table_name, field_name in table_names_to_fields.items():
	fields_.append(field_name)
	tables_.append(table_name)

fields_ = ', '.join(fields_)
join_ = tables_[0]
for i in range(1, len(tables_)):
	join_ += ' left join {0} on {1}.vid = {0}.vid'.format(tables_[i], tables_[0])

query = 'select {0}, content_field_org_name.vid from {1} limit 1000 offset 4'.format(fields_, join_)

cursor.execute(query)
records = cursor.fetchall()

affiliations = {
	'Blum Center': 1,	# Blum Center
	'UC-Affiliated': 2,	# UC Affiliated
	'Cal Corps': 3,	# Cal Corps
	'Student-Led Organization': 4,	# Student-Led
	'Faculty-Led Organization': 5,	# Faculty-Led
	'No Campus Affiliation': 6	# No Campus Affiliation,
}

sectors = {
	'Agriculture/Food Security': 1,	# Agriculture / Food Security
	'Collective Mobilization/Advocacy': 2,	# Collective Mobilization / Advocacy
	'Disaster/Humanitarian Relief': 3,	# Disaster / Humanitarian Relief
	'Education': 4,	# Education
	'Energy': 5,	# Energy
	'Environment/Sustainability': 6,	# Environment / Sustainability
	'Fair Trade/Market Access': 7,	# Fair Trade / Market Access
	'Gender Empowerment': 8,	# Gender Empowerment
	'Housing': 10,	# Housing
	'Human Rights/Law': 11,	# Human Rights / Law
	'Hunger/Malnutrition': 12,	# Hunger / Malnutrition
	# '': 13,	# Law
	'Immigration': 14,	# Immigration
	'Information Technology': 15,	# Information Technology
	'Microfinance/Small Entrepreneurship': 16,	# Microfinance
	'Refugee/Displaced Persons': 17,	# Refugee / Displaced Persons
	'Water/Sanitation': 18,	# Water / Sanitation
}


def lookup_sector(sector):
	if sector and sector.lower().startswith('healthcare'):
		return 9
	if sector in sectors:
		return sectors[sector]
	return 19


types = {
	'gov': 1,		# Government / UN-like (UNDP, World Bank, WTO)
	'corp': 2,		# For Profit / Corporation-Based Development Organization
	'ngo': 3,		# NGO / Non-Profit
	'social': 4,	# Social Enterprise / Corporate Social Responsibility
	'collective': 5,# Collection Action Group (union, social movement)
	'feebased': 6,	# Fee-Based Third Party Provider
	'other': 7		# Other (please describe below)
}

regions = {
	'Sub-Saharan Africa': 6,
	'India': 8,
	'United States/Canada': 1,
	'China': 7,
	'Other Asia': 9,
	'South America': 3,
	'Mexico/Central America': 2,
	'Middle East/North Africa (MENA)': 5,
	'South-East Asia': 9,
	'Oceana': 9,
	'Europe': 4
}

countries = {}
with open('countries.csv', mode='r') as infile:
	reader = csv.reader(infile)
	for row in csv.reader(infile):
		countries[row[1].upper()] = row[0]
		if row[0] == 'US':
			countries['USA'] = row[0]

organizations = []
sectors_query = 'select field_sector_value from content_field_sector where vid={}'
for record in records:
	organization = dict()
	organization['name'] = record[0]
	organization['address'] = {
		'city': record[2],
		'country': countries[record[6].upper()],
		'state': record[3],
		'street': record[1],
		'zip': record[4]
	}
	organization['contacts'] = [
		{
			'name': record[13],
			'role': record[16],
			'email': record[19],
			'phone': ''
		},
		{
			'name': record[14],
			'role': record[17],
			'email': record[20],
			'phone': ''
		},
		{
			'name': record[15],
			'role': record[18],
			'email': record[21],
			'phone': ''
		}
	]
	organization['region'] = 9
	if record[5] in regions:
		organization['region'] = regions[record[5]]
	organization['phone'] = record[7]
	organization['email'] = record[8]
	organization['website'] = record[9]
	organization['type'] = 7
	if record[10] in types:
		organization['type'] = types[record[10]]
	organization['approved'] = True if record[11] == '1' else False
	organization['numReviews'] = 0
	organization['dateAdded'] = 1578643395549

	cursor.execute(sectors_query.format(record[-1]))
	organization_sectors = cursor.fetchall()
	organization['sectors'] = [lookup_sector(sector[0]) for sector in organization_sectors]

	organizations.append(organization)

file_name = 'organizations.json'
with open(file_name, mode='w') as outfile:
	json.dump(organizations, outfile)

print ('{} organizations written to {}'.format(len(organizations), file_name))
