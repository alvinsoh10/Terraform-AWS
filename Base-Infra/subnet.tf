resource "aws_subnet" "public_1a"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.10.0.0/26"
    availability_zone = var.availability_zone_1a
    map_public_ip_on_launch = true
    tags = {
        Name = "public-ap-southeast-1a"
        "kubernetes.io/cluster/test-eks" = "shared"
        "kubernetes.io/role/elb" = 1
    }
}

resource "aws_subnet" "public_1b"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.10.0.64/26"
    availability_zone = "ap-southeast-1b"
    map_public_ip_on_launch = true
    tags = {
        Name = "public-ap-southeast-1b"
        "kubernetes.io/cluster/test-eks" = "shared"
        "kubernetes.io/role/elb" = 1
    }
}

resource "aws_subnet" "private_1a"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.10.0.128/26"
    availability_zone = "ap-southeast-1a"
    tags = {
        Name = "private-ap-southeast-1a"
        "kubernetes.io/cluster/test-eks" = "shared"
        "kubernetes.io/role/internal-elb" = 1
    }
}

resource "aws_subnet" "private_1b"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.10.0.192/26"
    availability_zone = "ap-southeast-1b"
    tags = {
        Name = "private-ap-southeast-1b"
        "kubernetes.io/cluster/test-eks" = "shared"
        "kubernetes.io/role/internal-elb" = 1
    }
}