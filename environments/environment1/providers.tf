terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      description = "User defined tag for components"
      Environment = var.environment
      Project     = "tech-test"
      Name        = "Somnath Dhadage"
    }
  }
}