## Assignment_2
### Problem Statement
We would like to be able to run the same stack closer to our customers in the US. Please build the same stack in the us-east-1 (Virginia) region. Note that Virginia has a different number of availability zones which we would like to take advantage of for better resilience. As for a CIDR block for the VPC use whatever you feel like, providing it's compliant with RFC-1918 and does not overlap with the dublin network.

### Solution :
  -- Replicating stack in us-east-1 with use of availabiliry zones from region for better resilliance. 
  -- CDR block used with RFC-1918 compliant
  -- CDR block does not overlap with the one used for dublin network

## Assignment_3
### Problem Statement
We are looking to improve the security of our network and have decided we need a bastion server to avoid logging on directly to our servers. Add a bastion server, the bastion should be the only route to SSH onto servers in the VPC.
  -- Bastion host added with security group.
  -- Bastion host allowing SSH route to servers in VPC.

## Assignment_4
We are looking for a Python3 Lambda function which writes the state of the instance(s) from the previous solution to a DynamoDB table every hour, and nothing on the table should be older than a day.
 -- Python script added to write instance status into DynamoDB
 -- Cron expression added to schedular for every one hour
 https://crontab.guru/#30_*_*_*_*
 -- TTL time set for 86400 seconds which is equivalent to 1 day.
 Note : Before running assignment please add additional policies to test-root user (CloudWatch/CloudWatchEvents). 
