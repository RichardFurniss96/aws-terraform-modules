module "vpc" {
    source = "./modules/vpc"

    vpc_name = "test-vpc"

    subnet_numbers = {
        "us-east-1a" = 1
    }
}