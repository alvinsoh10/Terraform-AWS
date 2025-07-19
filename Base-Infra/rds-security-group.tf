resource "aws_security_group" "allow_bastion" {
  name        = "allow_bastion"
  description = "Allow bastion inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "Allows Bastion access"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_bastion_inbound" {
  security_group_id = aws_security_group.allow_bastion.id
  referenced_security_group_id = aws_security_group.allow_ssh.id
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432
}

resource "aws_vpc_security_group_egress_rule" "allow_bastion_outbound" {
  security_group_id = aws_security_group.allow_bastion.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}