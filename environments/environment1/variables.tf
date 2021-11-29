# --- /environment/variables.tf ---

variable "region" {
  default = "eu-west-1"
}

variable "access_ip" {}

variable "environment" {}

variable "vpc-cidr" {}

variable "instance_type" {}

variable "subnet-cidr-public" {

}

variable "image_id" {}

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
# variable "route_table_id" {
#   default = ""
# }