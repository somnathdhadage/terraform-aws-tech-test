# ---- compute/main.tf -----

resource "aws_launch_template" "launchtemplate" {
  description = "Template to spin new EC2 instance with application in disaster"
  name_prefix   = "launch-template-nginx"
  image_id      = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  key_name                    = aws_key_pair.web.key_name
  placement {
    availability_zone = "${var.region}a"
  }
  user_data                   = <<EOF
  imageid = var.
#!/bin/sh
yum install -y nginx
service nginx start
EOF
}

resource "aws_autoscaling_group" "asg-tech-test" {
  description = "Autoscalling component to maintain number of active instances in case of any disaster"
  #availability_zones = ["${var.region}b"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  vpc_zone_identifier  = var.vpc_zone_identifier

  launch_template {
    id      = aws_launch_template.launchtemplate.id
    version = "$Latest"
  }

}

resource "aws_key_pair" "web" {
  description = "Public key security credentials to prove identity when connecting to an Amazon EC2 instance"
  public_key = file("${var.environment}_id_rsa.pub")
}