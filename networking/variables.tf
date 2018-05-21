variable "vpc_cidr" {
  description = "vpc cidr range"
  default     = "10.123.0.0/16"
}

variable "public_cidrs" {
  type        = "list"
  description = "public cidrs"
  default     = ["10.123.1.0/24", "10.123.2.0/24"]
}

variable "access_ip" {
  description = "allowed ip addresses"
  default     = "0.0.0.0/0"
}
