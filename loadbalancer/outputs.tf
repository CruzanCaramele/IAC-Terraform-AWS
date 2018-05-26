output "lb_name" {
  value = "${aws_lb.prod-tf-alb.dns_name}"
}

# output "targets" {
#   value = "${aws_lb_target_group_attachment.target_id.id}"
# }


# output "server_ids" {
#   value = "${module.compute.server_ids}"
# }

