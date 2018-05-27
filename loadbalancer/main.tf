#---------------------------------------------#
# Load Balancer #
#---------------------------------------------#
# resource "aws_lb" "prod-tf-alb" {
#   name                       = "${var.lb_name}"
#   internal                   = "${var.load_balancer_is_internal}"
#   load_balancer_type         = "application"
#   security_groups            = ["${var.lb_sg}"]
#   subnets                    = ["${var.lb_subnets}"]
#   enable_deletion_protection = "${var.enable_deletion_protection}"

#   access_logs {
#     bucket  = "${var.lb_access_logs_bucket}"
#     prefix  = "${var.lb_access_logs_prefix}"
#     enabled = "${var.lb_access_logs_is_enabled}"
#   }

#   tags {
#     Environment = "${var.lb_environment}"
#   }
# }

# resource "aws_lb_target_group" "prod-tf-http-tg" {
#   name     = "${var.lb_target_group_name}"
#   port     = "${var.lb_target_group_port}"
#   protocol = "HTTP"
#   vpc_id   = "${var.target_group_vpc_id}"
# }

# resource "aws_lb_target_group_attachment" "prod-tf-tg-attachment1" {
#   target_group_arn = "${aws_lb_target_group.prod-tf-http-tg.arn}"
#   target_id        = "${var.target_id1}"
#   port             = "${var.lb_target_group_port}"
# }

# resource "aws_lb_target_group_attachment" "prod-tf-tg-attachment2" {
#   target_group_arn = "${aws_lb_target_group.prod-tf-http-tg.arn}"
#   target_id        = "${var.target_id2}"
#   port             = "${var.lb_target_group_port}"
# }

# resource "aws_lb_listener" "prod-tf-listener1" {
#   load_balancer_arn = "${aws_lb.prod-tf-alb.arn}"
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     target_group_arn = "${aws_lb_target_group.prod-tf-http-tg.arn}"
#     type             = "forward"
#   }
# }

resource "aws_elb" "prod-tf-elb" {
  name            = "${var.lb_name}"
  subnets         = ["${var.elb_subnets}"]
  security_groups = ["${var.elb_security_groups}"]

  # availability_zones = ["${var.avail_zones}"]

  access_logs {
    bucket        = "${var.lb_access_logs_bucket}"
    bucket_prefix = "${var.lb_access_logs_prefix}"
    interval      = 60
  }
  listener {
    instance_port     = "${var.lb_target_group_port}"
    instance_protocol = "http"
    lb_port           = "${var.lb_target_group_port}"
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  instances                   = ["${var.lb_instances}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags {
    Name = "${var.lb_name}"
  }
}
