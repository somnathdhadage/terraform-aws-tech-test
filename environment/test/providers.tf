terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "tech-test-${var.environment}"
    }
  }
}