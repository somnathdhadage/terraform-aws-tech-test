resource "aws_launch_template" "launchtemplate" {
  name_prefix   = "launch-template-nginx"
  image_id      = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  key_name                    = aws_key_pair.web.key_name
  placement {
    availability_zone = "${var.region}a"
  }
}

resource "aws_autoscaling_group" "asg-tech-test" {
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
  public_key = file("${var.environment}_id_rsa.pub")
}