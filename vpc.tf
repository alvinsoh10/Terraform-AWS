resource "aws_vpc" "main"{
    #CIDR block for VPC
    cidr_block = "10.0.0.0/24"
    
    instance_tenancy = "default"

    enable_dns_support = true
    enable_dns_hostnames = true

    assign_generated_ipv6_cidr_block = false

    tags = {
        Name = "main"
    }
}

output "vpc_id" {
    value = aws_vpc.main.id
}