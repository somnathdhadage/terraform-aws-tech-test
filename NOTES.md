## About
> This is the repository for the ECS digital tech test terraform files.
- Owner : Somnath Dhadage
- Project : Tech Test

The aim is to have a solution to the following infrastructure issues - 
## Assignment_1 
The EC2 instance running Nginx went down over the weekend and we had an outage, it's been decided that we need a solution that is more resilient. Please implement a solution that demonstrates best practice resilience within a single region.

## Assignment_2
We would like to be able to run the same stack closer to our customers in the US. Please build the same stack in the us-east-1 (Virginia) region. Note that Virginia has a different number of availability zones which we would like to take advantage of for better resilience. As for a CIDR block for the VPC use whatever you feel like, providing it's compliant with RFC-1918 and does not overlap with the dublin network.

## Assignment_3
We are looking to improve the security of our network and have decided we need a bastion server to avoid logging on directly to our servers. Add a bastion server, the bastion should be the only route to SSH onto servers in the VPC.

## Assignment_4
We are looking for a Python3 Lambda function which writes the state of the instance(s) from the previous solution to a DynamoDB table every hour, and nothing on the table should be older than a day.

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

## Generate Pub key 
Public key can be gererated using aws or any 3rd party tool. I used ssh-keygen from ubuntu subsystem terminal on windows. Steps -  

```
somnath@LAPTOP-:~$ ssh-keygen -m PEM
Generating public/private rsa key pair.
Enter file in which to save the key (/home/somnath/.ssh/id_rsa): test_id_rsa.pub
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in test_id_rsa.pub
Your public key has been saved in test_id_rsa.pub.pub
The key fingerprint is: *****
```
Repeate above for bastion host as well. Copy files in root directory of project as code is refering to same location. 

Note : to run individual assignment navigate to folder respective to assignment, and then apply terraform commands. 
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

                        
Once login success 
## Initialise the terraform environment
run the following in the root of the appropriate environment folder ie Test Assignment/environments/<env>/. folder.
```
terraform init
```
Once login and terraform init gets successful. Login to terraform cloud to check if workspace got created. 
Do change settings for Execute mode (Your Organization > Workspace > <environment> > Settings > General > Execution Mode)

"Change it from Remote to Local"
## Validate the terraform code
This is a really useful command that validates the terraform code is correct
```
terraform validate
```
## Format the terraform code
This command is used to formate the code and returns files that got formated. 
```
terraform fmt
```
## Check the plan
if the terraform validate worked it is worth running a 
```
terraform plan
```
this will do a better check of the code and will check to make sure that everything can be created successfully.
Review the output of the plan to make sure that what is being listed is what you expect to be created.

## Apply the terraform code to create infrastructure.
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


# Project Folder structure
```
terraform graph
```
Folder structure is followed as per standards suggested by terraform
https://www.terraform.io/docs/language/modules/develop/structure.html
$ tree complete-module/

```

├── environments/                    # folder containing different environment configurations
│   ├── environment_1/               # environment folder for assignment1
│   │   ├── backends.tf              # Backend configuration
│   │   ├── main.tf                  # main terraform file. this has all the definitions of the infrastructure that then call the different modules
│   │   ├── providers.tf             # file used to set up the terraform providers used
│   │   ├── terraform.tfvars         # To define variables and initiate
│   │   ├── test_id_rsa_pub          # Public key for EC2 instance
│   │   ├── test_bastion_id_rsa_pub  # Public Key for bastion host
│   │   ├── variables.tf             # variables definitions used in the main.tf
│   ├── environment_2/               # environment folder for assignment2
│   │   ├── backends.tf              # Backend configuration
│   │   ├── main.tf                  # main terraform file. this has all the definitions of the infrastructure that then call the different modules
│   │   ├── providers.tf             # file used to set up the terraform providers used
│   │   ├── terraform.tfvars         # To define variables and initiate
│   │   ├── test_id_rsa_pub          # Public key for EC2 instance
│   │   ├── test_bastion_id_rsa_pub  # Public Key for bastion host
│   │   ├── variables.tf             # variables definitions used in the main.tf
│   │   ├── 
├── modules/                         # module folder for compute related functions
│   ├── compute
│   │   ├── variables.tf             # variables used to pass info from /environments/<env>/main.tf to the compute/main.tf file
│   │   ├── main.tf                  # main file for the compute module. this has multiple functions that are called from the root main.tf and create compute components
│   │   ├── outputs.tf               # output variable definitions
│   ├── database
│   │   ├── variables.tf             # variables used to pass info from /environments/<env>/main.tf to the database/main.tf file
│   │   ├── main.tf                  # main file for the database module. this has multiple functions that are called from the root main.tf and create database components
│   │   ├── outputs.tf
│   ├── network
│   │   ├── README.md                # main file for setting up networking components.
│   │   ├── variables.tf             # variables used to pass info from /environments/<env>/main.tf to the networking/main.tf file
│   │   ├── main.tf
│   │   ├── outputs.tf               # output values from networking module. this means that info can be referred to from /environment/<env>/main.tfand other modules.
├── NOTES.md                         # Detailed instructions to run assignments
├── README.md                        # Detailed assignment statements along with guidelines. 

```
# Developed 
Developed by Somnath Dhadage (somnathdhadage@gmail.com) in conjunction with origional ECS Digital Tech Test Code
