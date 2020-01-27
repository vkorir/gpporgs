import os
import json
import requests

token = 'jwt token'
headers = { 'Authorization': 'Bearer {}'.format(token) }
file_name = 'organizations.json'

def python_to_graphql(obj):
	if obj == None:
		return 'null'
	if isinstance(obj, bool):
		return 'true' if obj else 'false'
	if isinstance(obj, int):
		return str(obj)
	if isinstance(obj, str):
		return '"{}"'.format(obj.replace('"', '\\"'))
	if isinstance(obj, list):
		return '[{}]'.format(', '.join([python_to_graphql(val) for val in obj]))
	if isinstance(obj, dict):
		return '{' + ' '.join(['{0}: {1}'.format(key, python_to_graphql(obj[key])) for key in obj.keys()]) + '}'
	return str(obj)

organizations = []
if os.path.exists(file_name):
	with open(file_name) as file:
		organizations = json.load(file)

		mutation = lambda organizations: 'mutation { addOrganizations(organizations: ' + organizations + ') { id } }'
		# response = requests.post('http://localhost:8080/graphql', json={ 'query': mutate(mutify(organizations)) }, headers=headers)
		print (mutation(python_to_graphql(organizations)))

		os.remove(file_name)
else:
	print ('{} file not found.'.format(file_name))