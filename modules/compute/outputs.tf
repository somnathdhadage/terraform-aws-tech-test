#---- compute/outputs.tf ---
output "launchtemplate" {
  value = aws_launch_template.launchtemplate.id
}
