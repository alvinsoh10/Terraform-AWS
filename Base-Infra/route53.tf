resource "aws_route53_zone" "private" {
  name = "alvin.com"

  vpc {
    vpc_id = aws_vpc.main.id
  }
}

resource "aws_route53_record" "postgresdb" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "db.alvin.com"
  type    = "CNAME"
  ttl     = "30"
  records = [aws_db_instance.default.address]
}