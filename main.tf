resource "aws_kms_key" "dgkms" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "dgdemo12345" {
  bucket = var.bucket
  acl    = var.acl

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "dgdemo12345" {
  key        = "dgobject1"
  bucket     = aws_s3_bucket.dgdemo12345.id
  kms_key_id = aws_kms_key.dgkms.arn
}

