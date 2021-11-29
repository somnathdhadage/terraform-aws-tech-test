# ---- network/main.tf -----

resource "aws_internet_gateway" "igw" {
  description = "Component used to create a VPC Internet Gateway"
  vpc_id = var.vpc_id
}
resource "aws_route_table_association" "public-subnet-route-table-association" {
  description = "Component used to create an association between a route table and a subnet"
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}
resource "aws_security_group" "web-instance-security-group" {
  description = "Used to create security group rules"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}