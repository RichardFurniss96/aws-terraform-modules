
resource "aws_eip" "ngw_eip"{
    vpc = true
}

resource "aws_nat_gateway" "vpc_ngw" {
    for_each = aws_subnet.private_subnet

    allocation_id = aws_eip.ngw_eip.id
    subnet_id     = aws_subnet.public_subnet[each.key].id
    tags = {
        Name = "${var.vpc_name}-${each.key}-natgateway"
  }
}