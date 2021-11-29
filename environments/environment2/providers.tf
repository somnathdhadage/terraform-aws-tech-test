terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      description = "User defined tag for components"
      Project     = "tech-test"
      Name        = "Somnath Dhadage"
    }
  }
}