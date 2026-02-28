
resource "aws_instance" "test" {
  for_each = var.instance_type 
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = each.key
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_foreach"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc

  tags = {
    Name = "allow_tls"
  }
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
