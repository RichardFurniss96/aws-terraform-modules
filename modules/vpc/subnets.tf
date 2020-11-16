resource "aws_subnet" "private_subnet" {
    for_each = var.subnet_numbers

    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, each.value)
    availability_zone = each.key

    tags = {
        Name = "${var.vpc_name}-private-subnet-${each.value}"
    }
}


resource "aws_subnet" "public_subnet" {
    for_each = var.subnet_numbers

    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(local.public_subnet_cidr[1], 2, each.value)
    availability_zone = each.key

    tags = {
        Name = "${var.vpc_name}-public-subnet-${each.value}"
    }
}