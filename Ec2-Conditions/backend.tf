terraform {
backend "s3"{
bucket = "remote-backend-s3-dev"
key = "terraform.tfstate"
region = "us-east-1"
encrypt = true
use_lockfile = true
}
}