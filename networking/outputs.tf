output "public_subnets" {
  value = "${aws_subnet.prod_public_subnet.*.id}"
}

output "public_sg" {
  value = "${aws_security_group.prod_public_sg.id}"
}

output "subnet_ips" {
  value = "${aws_subnet.prod_public_subnet.*.cidr_block}"
}

output "subnet_ids" {
  value = "${aws_subnet.prod_public_subnet.*.id}"
}

output "prod_lb_sg" {
  value = "${aws_security_group.prod_lb_sg.id}"
}

output "vpc_id" {
  value = "${aws_vpc.prod_vpc.id}"
}

output "avail_zones" {
  value = "${data.aws_availability_zones.available.names}"
}

output "security_group_ids" {
  value = ["${aws_security_group.prod_public_sg.id}"]
}
