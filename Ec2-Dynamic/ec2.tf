
resource "aws_instance" "test" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "Devops"
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_dynamic"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc

  tags = {
    Name = "allow_tls"
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = toset(var.sg_ingress_rules)
    content {
       from_port = ingress.value.port
       to_port = ingress.value.port
       protocol = "tcp"
       cidr_blocks = ingress.value.cidr
       description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = toset(var.sg_egress_rules)
    content {
        from_port = egress.value.port
        to_port   = egress.value.port
        protocol  = egress.value.protocol
        cidr_blocks = egress.value.cidr
    }
}
}



