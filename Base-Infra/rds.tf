resource "aws_db_instance" "default" {
  allocated_storage    = 20
  db_name              = "postgresdb"
  engine               = "postgres"
  engine_version       = "17.4"
  instance_class       = "db.t4g.micro"
  identifier           = "alvin-test"
  username             = "postgres"
  password             = "password"
  parameter_group_name = "default.postgres17"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}

