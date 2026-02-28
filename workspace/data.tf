 data "aws_ami" "this" {
   most_recent = true
   owners = ["973714476881"]

   filter {
    name = "name"
    values = ["Redhat-9-DevOps-Practice"]
   }

   filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
   
 }