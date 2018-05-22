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
