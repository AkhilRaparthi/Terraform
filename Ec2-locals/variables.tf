variable "region" {default = "us-east-1"}
variable "accountid" { default = "192481307176"}
variable "vpc" { default = "vpc-0f4ae958d7b87114a" }


variable "ec2_tags" {
    default = {
    name = "demo-ec2"
    env = "prod"
    }
}