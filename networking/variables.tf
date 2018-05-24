variable "vpc_cidr" {
  description = "vpc cidr range"
}

variable "public_cidrs" {
  type        = "list"
  description = "public cidrs"
}

variable "access_ip" {
  description = "allowed ip addresses"
}
