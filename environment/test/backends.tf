# ---- /backends.tf ----

terraform {
  backend "remote" {
    organization = "ECSDigitalTest"

    workspaces {
      name = "ecs-test"
    }
  }
}