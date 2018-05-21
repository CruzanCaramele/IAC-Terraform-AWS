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
