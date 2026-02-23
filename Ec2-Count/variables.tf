variable "zone_id" {
  default = "Z08574073A6CKORTZ4GPT"
}

variable "instances" {
    default = ["mysql","rabbitmq","mongodb","redis","cart"]
}

variable "domain_name" {
  default = "akraparthi.online"
}
