#---------------------------------------------#
# Random id #
#---------------------------------------------#
resource "random_id" "prod_bucket_id" {
  byte_length = 2
}

#---------------------------------------------#
# S3 bucket #
#---------------------------------------------#
resource "aws_s3_bucket" "prod_bucket" {
  acl           = "private"
  bucket        = "${var.project_name}-${random_id.prod_bucket_id.dec}"
  force_destroy = true

  tags {
    Name = "prod_code_bucket"
  }
}
