variable "key_name" {
  description = "ssh key name"
  default     = "prodkey"
}

variable "public_key_path" {
  type        = "string"
  description = "path to public key"
  default     = "/Users/hamzayahaya/.ssh/id_rsa.pub"
}
