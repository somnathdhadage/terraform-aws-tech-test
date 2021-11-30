# --- /environment_2/variables.tf ---

variable "region" {
  default = "us-east-1"
}

variable "access_ip" {}

variable "environment" {}

variable "vpc-cidr" {}

variable "instance_type" {}

variable "subnet-cidr-public" {

}

variable "image_id" {
  default = "ami-0a176d9d7b597cc2c"
}

variable "launchtemplateid" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "igwid" {
  default = ""
}
# variable "subnet_id" {
#   default = ""
# }
variable "route_table_id" {
  default = ""
}