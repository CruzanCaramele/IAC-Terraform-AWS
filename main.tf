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

#---------------------------------------------#
# Load Balancer #
#---------------------------------------------#
module "loadbalancer" {
  source                     = "./loadbalancer"
  lb_name                    = "${var.lb_name}"
  load_balancer_is_internal  = "${var.load_balancer_is_internal}"
  lb_sg                      = "${module.networking.prod_lb_sg}"
  lb_subnets                 = "${module.networking.public_subnets}"
  enable_deletion_protection = "${var.enable_deletion_protection}"
  lb_access_logs_bucket      = "${module.storage.bucketname}"
  lb_access_logs_prefix      = "${var.lb_access_logs_prefix}"
  lb_access_logs_is_enabled  = "${var.lb_access_logs_is_enabled}"
  lb_environment             = "${var.lb_environment}"
  lb_target_group_name       = "${var.lb_target_group_name}"
  lb_target_group_port       = "${var.lb_target_group_port}"
  target_group_vpc_id        = "${module.networking.vpc_id}"
  num_instances              = "${module.compute.server_ids}"
}
