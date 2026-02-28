variable "vpc" { default = ["vpc-0f4ae958d7b87114a"] }

variable "type" {
    default = {
        dev = "t3.micro"
        mo = "t3.small"
        prod = "t3.medium"
    } 

}

variable "ingress_rule" {
    default = {
    ssh = {
            from_port = 22
            to_port = 22
            cidr_blocks = ["0.0.0.0/0"]
            protocol = "tcp"
        }
    https = {
            from_port = 443
            to_port = 443
            cidr_blocks = ["0.0.0.0/0"]
            protocol = "udp"    
        }

    }
}
variable "env" {
  default = "dev"
}

variable "common_tags" {
    type = map(string)
  default = {
    Name = "devops-project"
    terraform = "true"
    application = "roboshop"
    alias_id = "123456789"
  }
}

variable "sg_tags"  {
  default = {
  Name = "devops-case"
  terraform = "true"
  }
}
