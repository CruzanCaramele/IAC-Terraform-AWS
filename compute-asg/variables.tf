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
