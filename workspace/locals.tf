locals {
    ami_id = data.aws_ami.this.id
    env = "mo"
}