# --- root/main.tf --- 

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = true
}

resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet-cidr-public
  availability_zone = "${var.region}a"
}

resource "aws_route_table" "public-subnet-route-table" {
  vpc_id = aws_vpc.vpc.id
}


module "network" {
  source         = "../../modules/network"
  vpc_id         = aws_vpc.vpc.id
  #igwid          = var.igwid
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-subnet-route-table.id
}

resource "aws_instance" "web-instance" {
  ami                         = var.image_id
  instance_type               = "t2.small"
  vpc_security_group_ids      = [module.network.vpc_security_group_ids]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.web.key_name
  user_data                   = <<EOF
  imageid = var.
#!/bin/sh
yum install -y nginx
service nginx start
EOF
}

resource "aws_key_pair" "web" {
  public_key = file("${var.environment}_id_rsa.pub")
}



# # refactor later once solution implemented
module "compute" {
  source                 = "../../modules/compute"
  image_id               = var.image_id
  environment            = var.environment
  instance_type          = var.instance_type
  region                 = var.region
  launchtemplateid       = var.launchtemplateid
  public_key             = file("${var.environment}_id_rsa.pub")
  vpc_security_group_ids = module.network.vpc_security_group_ids
  subnet_id              = aws_subnet.public-subnet.id
  vpc_zone_identifier    = [aws_subnet.public-subnet.id]
}


