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
