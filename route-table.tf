resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public_route"
  }
}

resource "aws_route_table" "private_route_table_1a" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private_route_1a"
  }
}

resource "aws_route_table" "private_route_table_1b" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private_route_1b"
  }
}