## About
> This is the repository for the ECS digital tech test terraform files.
- Owner : Somnath Dhadage
- Project : Tech Test

The aim is to have a solution to the following infrastructure issues - 

1. The EC2 instance running Nginx went down over the weekend and we had an outage, it's been decided that we need a solution that is more resilient. Please implement a solution that demonstrates best practice resilience within a single region.
# Solution :
  -- Resiliance within single region..To Be Implemented


2. We would like to be able to run the same stack closer to our customers in the US. Please build the same stack in the us-east-1 (Virginia) region. Note that Virginia has a different number of availability zones which we would like to take advantage of for better resilience. As for a CIDR block for the VPC use whatever you feel like, providing it's compliant with RFC-1918 and does not overlap with the dublin network.
# Solution :
  -- Replicating stack in us-east-1 with use of availabiliry zones from region for better resilliance. 
  -- CDR block with RFC-1918 compliant..To Be Implemented

3. We are looking to improve the security of our network and have decided we need a bastion server to avoid logging on directly to our servers. Add a bastion server, the bastion should be the only route to SSH onto servers in the VPC.
# Solution :
 -- Baston host to restict logging directly into server
 -- Baston supporting SSH only route in the VPC..To Be Implemented

4. We are looking for a Python3 Lambda function which writes the state of the instance(s) from the previous solution to a DynamoDB table every hour, and nothing on the table should be older than a day.
 -- Python script to write instance status into DynamoDB
 -- Record should for every hour.
 -- Table should not hold data older than day..To Be Implemented

## Getting Started

### Prereq
> Install appropriate version of terraform based on OS as mentioned in problem statement (v.0.23.x) from 
https://releases.hashicorp.com/terraform/
e.g. Windows 
PS C:\Somnath\ECS\Assignment> terraform --version
Terraform v0.12.31
> set system environment variable path for terraform. 

> Install and configure terraform version 0.12.x
See docs here : https://learn.hashicorp.com/tutorials/terraform/install-cli

> Fork git repo & Clone repository

> setup aws environment variables.
aws configure

## Terraform backend
SetUp terraform cloud. Create organization(should be unique and not already in use). 

## Terraform login
This command is used to get login into terraform cloud and generate access token.
```
terraform login
```
It will ask for your answer. Do you want to proceed?
  Only 'yes' will be accepted to confirm.

  Enter a value:yes

  It will redirect you to browser. Complete login process to generate API token.
  Copy token and paste it in visual studio command promp. It will show login successful. 

  Retrieved token for user somnathdhadage

Retrieved token for user somnathdhadage


---------------------------------------------------------------------------------

                                          -
                                          -----                           -
                                          ---------                      --
                                          ---------  -                -----
                                           ---------  ------        -------
                                             -------  ---------  ----------
                                                ----  ---------- ----------
                                                  --  ---------- ----------
   Welcome to Terraform Cloud!                     -  ---------- -------
                                                      ---  ----- ---
   Documentation: terraform.io/docs/cloud             --------   -
                                                      ----------
                                                      ----------
                                                       ---------
                                                           -----
                                                               -

                        
## Initialise the terraform environment
run the following in the root of the appropriate environment folder ie Test Assignment/environment/<env>/. folder.
```
terraform init
```

## validate the terraform code
This is a really useful command that validates the terraform code is correct
```
terraform validate
```
## Format the terraform code
This command is used to formate the code and returns files that got formated. 
```
terraform fmt
```
## check the plan
if the terraform validate worked it is worth running a 
```
terraform plan
```
this will do a better check of the code and will check to make sure that everything can be created successfully.
Review the output of the plan to make sure that what is being listed is what you expect to be created.

## apply the terraform code to create infrastructure.
If everything is happy then it is time to create the infrastructure.
to do this run
```
terraform apply
or
terraform apply --auto-approve
```
If this is the first time running the code then it is worth running the plain terraform apply. This will list output and then require you to type yes to actually run the apply.
If you are confident that the code does what you want / need it to do then run with the --auto-approve option. 

## Teraform logout
```
terraform logout
```
It removing the stored credentials for app.terraform.io from the following file:
    /credentials.tfrc.json
and returns
Success! Terraform has removed the stored API token for app.terraform.io.


# folder structure
```
terraform graph
```
Folder structure is followed as per standards suggested by terraform
https://www.terraform.io/docs/language/modules/develop/structure.html


$ tree complete-module/
.
├── README.md
├── ...
├── environment/
│   ├── test/
│   │   ├── backends.tf
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── terraform.tfvars
│   │   ├── test_id_rsa_pub
│   │   ├── variables.tf
│   ├── .../
│   ├── us-test/
│   │   ├── 
├── modules/
│   ├── compute
│   │   ├── README.md
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   ├── network
│   │   ├── README.md
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   ├── database
│   │   ├── README.md
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   ├── outputs.tf

# Config developed by Somnath Dhadage
somnathdhadage@gmail.com in conjunction with origional ECS Digital Tech Test Code
