variable "region" {default = "us-east-1"}
variable "accountid" { default = "192481307176"}
variable "vpc" { default = "vpc-0f4ae958d7b87114a" }

variable "sg_ingress_rules" {
    default = [
        {
           port =22
           cidr = ["0.0.0.0/0"]
           description = "Allow port 22 from internet"
        },
        {
           port = 443
           cidr = ["0.0.0.0/0"]
           description = "Allow port 443 from internet"
        },
        {
           port = 3306
           cidr = ["0.0.0.0/0"]
           description = "Allow port 3306 from internet"
        }
    ]
}





variable "sg_egress_rules" {
    default = [
        {
           port = 0
           protocol = -1
           cidr = ["0.0.0.0/0"]
           description = "Allow port 22 from internet"
        }
    ]
}