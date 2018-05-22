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

#---------------------------------------------#
# Compute Resources #
#---------------------------------------------#
module "compute" {
  source             = "./compute"
  instance_count     = "${var.instance_count}"
  key_name           = "${var.key_name}"
  public_key_path    = "${var.public_key_path}"
  instance_type      = "${var.instance_type}"
  subnets            = "${module.networking.public_subnets}"
  vpc_security_group = "${module.networking.public_sg}"
  subnet_ips         = "${module.networking.subnet_ips}"
}
