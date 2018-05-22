output "server_ids" {
  value = "${join(", " ,aws_instance.prod_server.*.id)}"
}

output "server_ips" {
  value = "${join(", ", aws_instance.prod_server.*.public_ip)}"
}
