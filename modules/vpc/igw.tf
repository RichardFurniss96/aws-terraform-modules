resource "aws_internet_gateway" "vpc_igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${var.vpc_name}-igw"
    }
}