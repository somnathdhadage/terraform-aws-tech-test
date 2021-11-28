#---- compute/outputs.tf ---
output "web_domain" {
  value = aws_instance.web-instance.public_dns
}


