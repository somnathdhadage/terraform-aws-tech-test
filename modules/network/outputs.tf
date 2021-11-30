#---- network/outputs.tf ---
# output "vpc_id" {
#    value = aws_vpc.vpc.id
# }

output "vpc_security_group_ids" {
  value = aws_security_group.web-instance-security-group.id
}

output "igwid" {
  value = aws_internet_gateway.igw.id
}

output "route_table_id" {
  value = aws_route_table.public-subnet-route-table.id
}

  