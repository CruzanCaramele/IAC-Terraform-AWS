#---------------------------------------------#
# Random id #
#---------------------------------------------#
resource "random_id" "prod_bucket_id" {
  byte_length = 2
}

#---------------------------------------------#
# S3 bucket #
#---------------------------------------------#
data "aws_elb_service_account" "prod-elb-service-account" {}

resource "aws_s3_bucket" "prod_bucket" {
  acl           = "private"
  bucket        = "${var.project_name}-${random_id.prod_bucket_id.dec}"
  force_destroy = true

  policy = <<POLICY
{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.project_name}-${random_id.prod_bucket_id.dec}/AWSLogs/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.prod-elb-service-account.arn}"
        ]
      }
    }
  ]
}
POLICY

  tags {
    Name = "prod_code_bucket"
  }
}
