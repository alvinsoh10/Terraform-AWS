resource "aws_nat_gateway" "NAT1a"{
    allocation_id = aws_eip.nat_gw_1.id
    subnet_id = aws_subnet.public_1a.id
    tags = {
        Name = "Nat Gateway 1a"
    }
}

resource "aws_nat_gateway" "NAT1b"{
    allocation_id = aws_eip.nat_gw_2.id
    subnet_id = aws_subnet.public_1b.id
    tags = {
        Name = "Nat Gateway 1b"
    }
}