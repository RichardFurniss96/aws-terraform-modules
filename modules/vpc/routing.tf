resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${var.vpc_name}-public-route-table"
    }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${var.vpc_name}-private-route-table"
    }
}

resource "aws_route" "route_to_www" {
    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
}

resource "aws_route" "route_to_ngw" {
    for_each = aws_nat_gateway.vpc_ngw

    route_table_id = aws_route_table.private_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.vpc_ngw[each.key].id
}

resource "aws_route_table_association" "public_subnet_association" {
    for_each = aws_subnet.public_subnet

    subnet_id = aws_subnet.public_subnet[each.key].id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_association" {
    for_each = aws_subnet.private_subnet
    
    subnet_id = aws_subnet.private_subnet[each.key].id
    route_table_id = aws_route_table.private_route_table.id
}