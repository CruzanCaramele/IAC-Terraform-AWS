#---------------------------------------------#
# Load Balancer #
#---------------------------------------------#
resource "aws_lb" "prod-tf-alb" {
  name                       = "${var.lb_name}"
  internal                   = "${var.load_balancer_is_internal}"
  load_balancer_type         = "application"
  security_groups            = ["${var.lb_sg}"]
  subnets                    = ["${var.lb_subnets}"]
  enable_deletion_protection = "${var.enable_deletion_protection}"

  access_logs {
    bucket  = "${var.lb_access_logs_bucket}"
    prefix  = "${var.lb_access_logs_prefix}"
    enabled = "${var.lb_access_logs_is_enabled}"
  }

  tags {
    Environment = "${var.lb_environment}"
  }
}
