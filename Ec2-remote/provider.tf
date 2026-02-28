terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0" # Recommended to pin versions
    }   
  }
    backend "s3" {
      bucket = "devops-remote-state-file"
      key = "Terraform/Ec2-remote/devops.tfstate"
      region = "us-east-1"
      encrypt = "true"
      use_lockfile = "true"
    }
}

// Configure the AWS provider
provider "aws" {
  region = "us-east-1"
} 


