variable "aws_region" {
  description = "region to deploy resources"
}

variable "project_name" {
  description = "s3 bucket name uses the project name"
}

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
