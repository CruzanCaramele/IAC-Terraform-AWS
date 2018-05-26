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

resource "aws_lb_target_group" "prod-tf-http-tg" {
  name     = "${var.lb_target_group_name}"
  port     = "${var.lb_target_group_port}"
  protocol = "HTTP"
  vpc_id   = "${var.target_group_vpc_id}"
}

resource "aws_lb_target_group_attachment" "prod-tf-tg-attachment1" {
  target_group_arn = "${aws_lb_target_group.prod-tf-http-tg.arn}"
  target_id        = "${var.target_id1}"
  port             = "${var.lb_target_group_port}"
}

resource "aws_lb_target_group_attachment" "prod-tf-tg-attachment2" {
  target_group_arn = "${aws_lb_target_group.prod-tf-http-tg.arn}"
  target_id        = "${var.target_id2}"
  port             = "${var.lb_target_group_port}"
}

resource "aws_lb_listener" "prod-tf-listener1" {
  load_balancer_arn = "${aws_lb.prod-tf-alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.prod-tf-http-tg.arn}"
    type             = "forward"
  }
}
