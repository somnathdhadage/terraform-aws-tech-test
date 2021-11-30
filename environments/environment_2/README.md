# Assignment_2
## Problem Statement
We would like to be able to run the same stack closer to our customers in the US. Please build the same stack in the us-east-1 (Virginia) region. Note that Virginia has a different number of availability zones which we would like to take advantage of for better resilience. As for a CIDR block for the VPC use whatever you feel like, providing it's compliant with RFC-1918 and does not overlap with the dublin network.

## Solution
To tun solution on visual studio terminal navigate to assignment apecifc environment. Here it should be 
\terraform-aws-tech-test\environments\environment2>

Then terraform basic commands as provided in NOTES.md from root directory.

- As per requirment we will be setting up environment in us-east-1 (Virginia) region
- As multiple AZ's present in given region for better resilience used miltiple rather than one
- 