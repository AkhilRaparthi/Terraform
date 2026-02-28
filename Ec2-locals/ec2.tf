
resource "aws_instance" "test" {
  ami           = local.ami
  instance_type = local.type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = local.ec2_tags
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc

  tags = local.tags
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}



# #creating instance profile
# resource "aws_iam_instance_profile" "ec2_profile" {
#   name = "EC2-S3-Access"
#   role = aws_iam_role.ec2_role.name
# }
