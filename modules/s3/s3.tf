resource "aws_s3_bucket" "t1" {
  bucket = var.bucket_name
  acl    = var.bucket_acl
  versioning {
    enabled = var.bucket_versioning_enabled
  }

  tags = {
    Name        = var.bucket_tag_name
    Environment = var.bucket_tag_environment
  }
}


#resource "aws_s3_bucket" "t2" {
#  bucket = "stage-env-bucket"
#  acl    = "private"
#  versioning {
#    enabled = false
#  }
#
#  tags = {
#    Name        = "stage-bucket"
#    Environment = "stage"
#  }
#}
#

#resource "aws_s3_bucket" "t3" {
#  bucket = "prod-env-bucket"
#  acl    = "private"
#  versioning {
#    enabled = false
#  }

#  tags = {
#    Name        = "prod-bucket"
#    Environment = "prod"
#  }
#}
