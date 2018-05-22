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
resource "aws_key_pair" "tf_auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}
