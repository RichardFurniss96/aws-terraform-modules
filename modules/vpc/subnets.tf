resource "aws_subnet" "private_subnet_az1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr_az1
    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {
        Name = var.
    }
}

resource "aws_subnet" "private_subnet_az2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr_az2
    availability_zone = data.aws_availability_zones.available.names[1]
}

resource "aws_subnet" "public_subnet_az1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr_az1
    availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "public_subnet_az2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr_az2
    availability_zone = data.aws_availability_zones.available.names[1]
}