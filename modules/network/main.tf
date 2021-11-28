

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
}
resource "aws_route_table_association" "public-subnet-route-table-association" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}
resource "aws_security_group" "web-instance-security-group" {
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