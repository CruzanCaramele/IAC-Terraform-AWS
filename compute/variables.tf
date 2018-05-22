variable "key_name" {
  description = "ssh key name"
}

variable "public_key_path" {
  type        = "string"
  description = "path to public key"
}

variable "subnet_ips" {
  type        = "list"
  description = "public subnet ips"
}

variable "instance_count" {
  description = "number of instances"
}

variable "instance_type" {
  description = "ec2 instance type to deploy"
}

variable "vpc_security_group" {
  description = "vpc security group"
}

variable "subnets" {
  type        = "list"
  description = "subnet ids provided from aws"
}
