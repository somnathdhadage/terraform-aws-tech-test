#---- compute/outputs.tf ---
output "launchtemplateid" {
  value = aws_launch_template.launchtemplate.id
}
