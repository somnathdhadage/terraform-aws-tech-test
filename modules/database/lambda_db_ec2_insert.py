import boto3
import time
import datetime

def lambda_handler(event, context):
   
   client = boto3.client('ec2')
   now = datetime.datetime.now()
   dynamodb = boto3.resource('dynamodb')

   # TTL Time set for 1 day 
   epoch = round(time.time())
   ttl = epoch + 86400

   # Retrieve ec2 instance status
   response = client.describe_instance_status(
     IncludeAllInstances=True
   )

  
   message=[]
   for instances in response['InstanceStatuses']:
      status = instances['InstanceState']['Name']
      id = instances['InstanceId']
      entry=id, status
      message.append(entry)


   # Insert Data into DynamoDB
   table = dynamodb.Table('ec2statuslog')

   table.put_item(
      Item={
         'ttl':ttl,
         'date':(now.strftime("%Y-%m-%d %H:%M:%S")),
         'message':("Status of instances is: %s" % (message,))
      }
   )

