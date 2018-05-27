#---------------------------------------------#
# Remote State #
#---------------------------------------------#
terraform {
  backend "s3" {
    bucket = "your-bucket-name"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
