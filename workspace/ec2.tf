resource "aws_instance" "dev" {
  ami = local.ami_id
  instance_type = lookup ( var.type , local.env )
    vpc_security_group_ids = [aws_security_group.dev.id]
  tags = var.common_tags
}


resource "aws_security_group" "dev" {
    name = "devops-123-${var.env}-sg"
    description = "Allow traffic from my laptop"

}

resource "aws_security_group_rule" "ingress" {
    type = "ingress"
    for_each = var.ingress_rule
    from_port = each.value.from_port
    to_port = each.value.to_port
    cidr_blocks = each.value.cidr_blocks
    protocol = each.value.protocol
    security_group_id = aws_security_group.dev.id
}
