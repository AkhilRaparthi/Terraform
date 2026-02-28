terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0" # Recommended to pin versions
    }
  }
}

// Configure the AWS provider
provider "aws" {
  region = "us-east-1"
} 


