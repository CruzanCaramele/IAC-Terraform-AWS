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
