#---------------------------------------------#
# Provider #
#---------------------------------------------#
provider "aws" {
  region = "${var.aws_region}"
}

#---------------------------------------------#
# Storage resources #
#---------------------------------------------#
module "storage" {
  source       = "./storage"
  project_name = "${var.project_name}"
}

#---------------------------------------------#
# Networking Reources #
#---------------------------------------------#
module "networking" {
  source       = "./networking"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  access_ip    = "${var.access_ip}"
}
