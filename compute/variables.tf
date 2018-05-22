variable "key_name" {
  description = "ssh key name"
  default     = "prodkey"
}

variable "public_key_path" {
  type        = "string"
  description = "path to public key"
  default     = "/Users/hamzayahaya/.ssh/id_rsa.pub"
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

variable "security_group" {
  description = "vpc security group"
}

variable "subnets" {
  description = "subnet ids provided from aws"
}
