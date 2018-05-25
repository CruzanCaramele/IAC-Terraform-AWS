output "public_subnets" {
  value = "${aws_subnet.prod_public_subnet.*.id}"
}

output "public_sg" {
  value = "${aws_security_group.prod_public_sg.id}"
}

output "subnet_ips" {
  value = "${aws_subnet.prod_public_subnet.*.cidr_block}"
}

output "prod_lb_sg" {
  value = "${aws_security_group.prod_lb_sg.id}"
}

output "vpc_id" {
  value = "${aws_vpc.prod_vpc.id}"
}
