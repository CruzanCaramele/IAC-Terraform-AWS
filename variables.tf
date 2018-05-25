variable "aws_region" {
  description = "region to deploy resources"
}

#---------------------------------------------#
# Storage Variables #
#---------------------------------------------#
variable "project_name" {
  description = "s3 bucket name uses the project name"
}

#---------------------------------------------#
# Networking variables #
#---------------------------------------------#
variable "vpc_cidr" {
  description = "vpc cidr block range"
}

variable "public_cidrs" {
  type        = "list"
  description = "public cidr blocks"
}

variable "access_ip" {
  description = "allowed ip addresses"
}

#---------------------------------------------#
# Compute Variables #
#---------------------------------------------#
variable "key_name" {
  description = "ssh key name"
}

variable "public_key_path" {
  type        = "string"
  description = "path to public key"
}

variable "instance_count" {
  description = "number of instances"
}

variable "instance_type" {
  description = "ec2 instance type to deploy"
}

#---------------------------------------------#
# Load Balancer Variables #
#---------------------------------------------#
variable "lb_name" {
  description = "name of application load balancer"
}

variable "load_balancer_is_internal" {
  description = "external or internal"
}

variable "enable_deletion_protection" {
  description = "if enabled lb will be protected from deletion"
}

variable "lb_access_logs_prefix" {
  description = "folder to store logs within the s3 bucket"
}

variable "lb_access_logs_is_enabled" {
  description = "enable logging - boolean value"
}

variable "lb_environment" {
  description = "working environment"
}

variable "lb_target_group_name" {
  description = "target group name for load balancer"
}

variable "lb_target_group_port" {
  description = "port for lb target group"
}
