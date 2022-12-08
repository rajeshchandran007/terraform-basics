resource "aws_route53_record" "component" {
  zone_id = "Zxxxxxxxxxxxxxx"
  name    = "${var.COMPONENT}-dev.robot.internal"
  type    = "A"
  ttl     = 10
  # records = [aws_spot_instance_request.spot.private_ip]
  records = [aws_instance.app.private_ip]
}