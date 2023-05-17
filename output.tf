output "alb_dns_name" {
  value = aws_alb.ext-alb.dns_name
}

output "alb_target_group_arn" {
  value = aws_alb_target_group.nginx-tgt1.arn
}