variable "lb_name" {
  description = "name of application load balancer"
  default     = "prod-alb"
}

variable "load_balancer_is_internal" {
  description = "external or internal"
  default     = false
}

variable "lb_sg" {
  description = "security group for lb"
}

variable "lb_subnets" {
  type        = "list"
  description = "subnets for lb"
}

variable "enable_deletion_protection" {
  description = "if enabled lb will be protected from deletion"
}

variable "lb_access_logs_bucket" {
  description = "s3 bucket for stroring lb access logs"
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
  description = "name of target group for load balancer"
}

variable "lb_target_group_port" {
  description = "port number for load balancer target group"
}

variable "target_group_vpc_id" {
  description = "VPC ID"
}

variable "num_instances" {
  description = "list of instances to register to target group"
}

variable "target_id1" {
  description = "number of target groups to create"
}

variable "target_id2" {
  description = "number of target groups to create"
}
