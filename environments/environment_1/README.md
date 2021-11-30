## Assignment_1 
### Problem Statement
The EC2 instance running Nginx went down over the weekend and we had an outage, it's been decided that we need a solution that is more resilient. Please implement a solution that demonstrates best practice resilience within a single region.
### Solution :
-- We have added autoscalling for EC2 instance which will maintain number active instances. 
-- Created template with configuration same as desired. Solution implemented in eu-west-1 region.
-- Autoscalling group will start new instance in same region in case of any disaster.

