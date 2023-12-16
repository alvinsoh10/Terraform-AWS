resource "aws_eip" "nat_gw_1"{
    depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "nat_gw_2"{
    depends_on = [aws_internet_gateway.main]
}
