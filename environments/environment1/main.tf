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

#  "Network module to create network specific components"
module "network" {
  source = "../../modules/network"
  vpc_id = aws_vpc.vpc.id
  #igwid          = var.igwid
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = var.route_table_id
}

#  Component creates EC2 instance with nginx component installed with user provided image"
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


# Compute module used to create compute resourses 
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



resource "aws_key_pair" "web" {
  public_key = file("${var.environment}_id_rsa.pub")
}
