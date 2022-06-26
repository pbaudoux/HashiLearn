terraform {
  # Remove cloud block if you want to move back to local state
  cloud {
    organization = "pbaudoux-hashilearn"
    workspaces {
      name = "learn-terraform-aws-instance-workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
  # aws cli has a "Terraform" profile set up in ~/.aws
  # Need to be commented out when using Terraform Cloud
  # profile = "Terraform"
}

# ressource "ressource_type" "ressource_name"
# aws_instance.app_server = unique ID of that ressource
resource "aws_instance" "app_server" {
  ami           = "ami-0a1ee2fb28fe05df3"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name # Defined in variables.tf
    # Variables can be overriden during deployment with -var
    # terraform apply -var "instance_name=YetAnotherName"
  }
}
