locals {
    name = "devops-sg"
    name_ec2 = "devops-ec2"
    type = "t3.micro"
    ami = "ami-0220d79f3f480ecf5"
    common_tags = {
        name = "demo"
        terraform = "true"
        env = "dev"
    }
    ec2_tags = {
        name = "demo-ec2"
        env = "prod"
    }

    tags = merge(local.common_tags, var.ec2_tags)
}