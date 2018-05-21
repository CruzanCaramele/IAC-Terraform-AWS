output "bucketname" {
  value = "${aws_s3_bucket.prod_bucket.id}"
}
