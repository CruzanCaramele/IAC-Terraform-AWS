variable "aws_alb" {
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
