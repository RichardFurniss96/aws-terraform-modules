variable vpc_cidr_block {
    type = string
    default = "10.0.0.0/16"
}

variable vpc_name {
    type = string
}

variable private_subnet_cidr_az1 {
    type = string
    default = "10.0.0.0/18"
}

variable private_subnet_cidr_az2 {
    type = string
    default = "10.0.64.0/18"
}

variable public_subnet_cidr_az1 {
    type = string
    default = "10.0.128.0/18"
}

variable public_subnet_cidr_az2 {
    type = string
    default = "10.0.192.0/18"
}