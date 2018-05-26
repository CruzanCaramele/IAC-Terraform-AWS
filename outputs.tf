#---------------------------------------------#
# Storage outputs #
#---------------------------------------------#
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}

#---------------------------------------------#
# Networking outputs #
#---------------------------------------------#
output "Public Subnets" {
  value = "${join(", ", module.networking.public_subnets)}"
}

output "Subnet IPs" {
  value = "${join(", ", module.networking.subnet_ips)}"
}

output "Public Security Group" {
  value = "${module.networking.public_sg}"
}

#---------------------------------------------#
# Compute outputs #
#---------------------------------------------#
output "Server ID1" {
  value = "${module.compute.server_id1}"
}

output "Server ID2" {
  value = "${module.compute.server_id2}"
}

output "Server IPs" {
  value = "${module.compute.server_ips}"
}

#---------------------------------------------#
# Load Balancer outputs #
#---------------------------------------------#
output "Load Balancer" {
  value = "${module.loadbalancer.lb_name}"
}
