# ---- /backends.tf ----

terraform {
  backend "remote" {
    organization     = "ECSDigitalTest"
    required_version = ">= 0.12"
    workspaces {
      name = "ecs-test-try"
      #name ="ecs-test" 
    }
  }
}