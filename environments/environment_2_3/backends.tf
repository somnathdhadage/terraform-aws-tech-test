# ---- environment2/backends.tf ----

terraform {
  backend "remote" {
    organization     = "ECSDigitalTest"
    workspaces {
      name = "ecs-test-environment2"
      #name ="ecs-test" 
    }
  }
}