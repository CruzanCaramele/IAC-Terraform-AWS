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
# Instances #
#---------------------------------------------#
resource "aws_instance" "prod_server" {
  count                  = "${var.instance_count}"
  instance_type          = "${var.instance_type}"
  ami                    = "${data.aws_ami.server_ami.id}"
  key_name               = "${aws_key_pair.prod_auth.id}"
  vpc_security_group_ids = ["${var.vpc_security_group}"]
  subnet_id              = "${element(var.subnets, count.index)}"
  user_data              = "${data.template_file.user-init.*.rendered[count.index]}"

  tags {
    Name = "prod_server-${count.index+1}"
  }
}
