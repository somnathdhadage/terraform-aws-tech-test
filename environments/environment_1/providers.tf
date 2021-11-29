terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      description = "User defined tag for components"
      Project     = "tech-test"
      Name        = "Somnath Dhadage"
    }
  }
}