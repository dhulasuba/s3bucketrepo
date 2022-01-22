resource "aws_kms_key" "dgkmsfortest" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "testbucketforkms" {
  bucket = var.bucket
  acl    = var.acl

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "testbucketforkms" {
  key        = "dgobjecttest"
  bucket     = aws_s3_bucket.testbucketforkms.id
  kms_key_id = aws_kms_key.dgkmsfortest.arn
}

