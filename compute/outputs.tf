# output "server_id1" {
#   value = "${aws_instance.prod_server.0.id}"
# }

# output "server_id2" {
#   value = "${aws_instance.prod_server.1.id}"
# }

output "server_ids" {
  value = "${aws_instance.prod_server.*.id}"
}

output "server_ips" {
  value = "${join(", ", aws_instance.prod_server.*.public_ip)}"
}
