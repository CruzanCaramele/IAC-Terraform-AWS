#---------------------------------------------#
# Load Balancer #
#---------------------------------------------#
resource "aws_lb" "prod-tf-alb" {
  name               = "${var.aws_alb}"
  internal           = "${var.load_balancer_is_internal}"
  load_balancer_type = "application"
  security_groups    = ["${var.lb_sg}"]
  subnets            = ["${var.lb_subnets}"]
}
