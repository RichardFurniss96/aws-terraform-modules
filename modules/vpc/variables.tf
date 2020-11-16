variable vpc_cidr_block {
    type = string
    default = "10.0.0.0/20"
}

locals {
    public_subnet_cidr = cidrsubnets(var.vpc_cidr_block, 1, 2)
}

variable vpc_name {
    type = string
}

variable "subnet_numbers" {
  default = {
    "us-east-1a" = 1
    "us-east-1b" = 2
    "us-east-1c" = 3
  }
}