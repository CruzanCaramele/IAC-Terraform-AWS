#---------------------------------------------#
# Remote State #
#---------------------------------------------#
terraform {
  backend "s3" {
    bucket = "terraform-state-zeeman"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
