#---------------------------------------------#
# AMI Data Source #
#---------------------------------------------#
data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

#---------------------------------------------#
# Key Pair #
#---------------------------------------------#
resource "aws_key_pair" "prod_auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

#---------------------------------------------#
# Template File #
#---------------------------------------------#
data "template_file" "user-init" {
  count    = 2
  template = "${file("${path.module}/userdata.tpl")}"

  vars {
    firewall_subnets = "${element(var.subnet_ips, count.index)}"
  }
}

#---------------------------------------------#
# Launch COnfiguration #
#---------------------------------------------#
resource "aws_launch_configuration" "prod-tf-launch-config" {
  name              = "${var.launch_config_name}"
  image_id          = "${data.aws_ami.server_ami.id}"
  instance_type     = "${var.launcg_config_instance_type}"
  key_name          = "${aws_key_pair.prod_auth.id}"
  user_data         = "${data.template_file.user-init.*.rendered[count.index]}"
  security_groups   = ["${var.vpc_security_group}"]
  enable_monitoring = true
}

#---------------------------------------------#
# Auto Scaling Group #
#---------------------------------------------#
resource "aws_autoscaling_group" "prod-tf-autoscaling-group" {
  name              = "${var.asg_name}"
  max_size          = "${var.asg_max_size}"
  min_size          = "${var.asg_min_size}"
  desired_capacity  = "${var.desired_capacity}"
  load_balancers    = ["${var.load_balancers}"]
  health_check_type = "${var.health_check_type}"
}
