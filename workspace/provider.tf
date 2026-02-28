terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.33.0"
        }
    }

    backend "s3" {
        bucket = "remote-backend-s3-dev"
        key = "workspace/terraform1.tfstate"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
        }
}