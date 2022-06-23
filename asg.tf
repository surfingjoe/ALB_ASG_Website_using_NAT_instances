#--------- setup AWS permission for Website to describe EC2 ID -------------------
resource "aws_iam_role" "this" {
  name               = "alb-role"
  assume_role_policy = file("trust_rel.json")
}
resource "aws_iam_role_policy" "this" {
  name   = "ec2-describe"
  role   = aws_iam_role.this.id
  policy = file("policy.json")
}
resource "aws_iam_instance_profile" "this" {
  role = aws_iam_role.this.name
}

#--------- Get Ubuntu 20.04 AMI image (SSM Parameter data) -------------------
data "aws_ssm_parameter" "ubuntu-focal" {
  name = "/aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}

# Using Launch Template
resource "aws_launch_template" "website" {
  image_id = data.aws_ssm_parameter.ubuntu-focal.value
  # iam_instance_profile { name = "assume_role_profile" }
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
  user_data              = base64encode("${data.template_file.bootstrap.rendered}")
  lifecycle { create_before_destroy = true }
}

# Parameters for Auto Scaling Group
resource "aws_autoscaling_group" "website_asg" {
  launch_template {
    name    = aws_launch_template.website.name
    version = aws_launch_template.website.latest_version
  }
  vpc_zone_identifier = [aws_subnet.private-1.id, aws_subnet.private-2.id]
  health_check_type   = "ELB"
  target_group_arns   = [aws_lb_target_group.website-target.arn]
  health_check_grace_period = 300
  force_delete              = true
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2

  tag {
    key                 = "Name"
    value               = "website_ASG"
    propagate_at_launch = true
  }
}

data "template_file" "bootstrap" {
  template = file("bootstrap_web.tpl")
}
