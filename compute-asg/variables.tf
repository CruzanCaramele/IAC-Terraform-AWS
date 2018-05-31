#---------------------------------------------#
# Launch Configuration Variables#
#---------------------------------------------#
variable "launch_config_name" {
  description = "name of launch configuration"
}

variable "launcg_config_instance_type" {
  description = "the type of instance to launch"
}

variable "vpc_security_group" {
  description = "security group of scaling group"
}

#---------------------------------------------#
# Auto Scaling Group Variables#
#---------------------------------------------#

variable "asg_name" {
  description = "name of auto scaling group"
}

variable "asg_max_size" {
  description = "asg max size"
}

variable "asg_min_size" {
  description = "asg min size"
}

variable "desired_capacity" {
  description = "number of instances that should be running"
}

variable "load_balancers" {
  type        = "list"
  description = "load balancers associated to the asg"
}

variable "var.health_check_type" {
  description = "type of health check ELB or EC2"
}

variable "target_group_arns" {
  type        = "list"
  description = "target groups for app load balancer"
}
