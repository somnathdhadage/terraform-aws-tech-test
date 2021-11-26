# --- /environment/prod/variables.tf ---

variable "region" {
  default = "eu-west-1"
}


variable "access_ip" {}

variable "environment" {}

variable "vpc-cidr" {
}

variable "subnet-cidr-public" {
}

