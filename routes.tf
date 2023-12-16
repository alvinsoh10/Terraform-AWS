resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_route" "private_route_1a" {
  route_table_id = aws_route_table.private_route_table_1a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NAT1a.id 
}

resource "aws_route" "private_route_1b" {
  route_table_id = aws_route_table.private_route_table_1b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NAT1b.id 
}