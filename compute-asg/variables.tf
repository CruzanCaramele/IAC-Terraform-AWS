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
