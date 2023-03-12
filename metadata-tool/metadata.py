import json
import requests
# meta data urls for different data
INSTANCE_ID_URL = 'http://169.254.169.254/latest/meta-data/instance-id'
INSTANCE_TYPE_URL = 'http://169.254.169.254/latest/meta-data/instance-type'
INSTANCE_HOSTNAME_URL= 'http://169.254.169.254/latest/meta-data/local-hostname' 
AVAILABILITY_ZONE_URL = 'http://169.254.169.254/latest/meta-data/placement/availability-zone'
REGION_URL = 'http://169.254.169.254/latest/meta-data/placement/region'

# retriving metadata from metadata urls
instance_id = requests.get(INSTANCE_ID_URL).text
instance_type = requests.get(INSTANCE_TYPE_URL).text
instance_hostname = requests.get(INSTANCE_HOSTNAME_URL).text
availability_zone = requests.get(AVAILABILITY_ZONE_URL).text
region = requests.get(REGION_URL).text

# creating dictionary with the retrieved metadata
metadata = {
    'instance_id': instance_id,
    'instance_type': instance_type,
    'instance_hostname':instance_hostname,
    'availability_zone': availability_zone,
    'region': region
}

# Convert the metadata dictionary to a JSON-formatted string
metadata_json = json.dumps(metadata)

print(metadata_json)