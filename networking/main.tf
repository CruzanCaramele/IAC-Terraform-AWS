#---------------------------------------------#
# Availability zones using data resource #
#---------------------------------------------#
data "aws_availability_zones" "available" {}

#---------------------------------------------#
# VPC #
#---------------------------------------------#
resource "aws_vpc" "prod_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "prod_vpc"
  }
}

#---------------------------------------------#
# Internet Gateway #
#---------------------------------------------#
resource "aws_internet_gateway" "prod_internet_gateway" {
  vpc_id = "${aws_vpc.prod_vpc.id}"

  tags {
    Name = "prod_igw"
  }
}

#---------------------------------------------#
# Route tables #
#---------------------------------------------#
resource "aws_route_table" "prod_public_rt" {
  vpc_id = "${aws_vpc.prod_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.prod_internet_gateway.id}"
  }

  tags {
    Name = "prod_public"
  }
}

resource "aws_default_route_table" "prod_private_rt" {
  default_route_table_id = "{aws_vpc.prod_vpc.default_route_table.id}"

  tags = {
    Name = "prod_private"
  }
}

#---------------------------------------------#
# Subnets #
#---------------------------------------------#
resource "aws_subnet" "prod_public_subnet" {
  count                   = 2
  vpc_id                  = "${aws_vpc.prod_vpc.id}"
  cidr_block              = "${var.public_cidrs[count.index]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "prod_public_${count.index + 1}"
  }
}

resource "aws_route_table_association" "prod_public_assoc" {
  count          = "${aws_subnet.prod_public_subnet.count}"
  subnet_id      = "${aws_subnet.prod_public_subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.prod_public_rt.id}"
}

#---------------------------------------------#
# Security groups #
#---------------------------------------------#
resource "aws_security_group" "prod_public_sg" {
  name        = "prod_public_sg"
  description = "access to public instances"
  vpc_id      = "${aws_vpc.prod_vpc.id}"

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.access_ip}"]
  }

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.access_ip}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "prod_lb_sg" {
  name        = "prod_lb_sg"
  description = "load balancer security group"
  vpc_id      = "${aws_vpc.prod_vpc.id}"

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.access_ip}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
