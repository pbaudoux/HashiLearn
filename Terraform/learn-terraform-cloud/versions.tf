terraform {

/* When using VCS-driven workflow, cloud block is not needed
  cloud {
    organization = "pbaudoux-hashilearn"

    workspaces {
      name = "learn-terraform-cloud"
    }
  }
*/

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 0.14.0"
}
