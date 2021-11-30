# ---- network/main.tf -----

resource "aws_route_table" "public-subnet-route-table" {
  vpc_id = var.vpc_id
}


 #Component to create a VPC Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
}

#  Component used to create an association between a route table and a subnet
resource "aws_route_table_association" "public-subnet-route-table-association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.public-subnet-route-table.id
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