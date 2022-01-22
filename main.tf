resource "aws_kms_key" "dgkms" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "dgsrdd" {
  bucket = var.bucket
  acl    = var.acl

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "dgbucket_object" {
  key        = "dgobject1"
  bucket     = aws_s3_bucket.dgsrdd.id
  kms_key_id = aws_kms_key.dgkms.arn
}
resource "aws_instance" "example" {
  ami           = "ami-0af25d0df86db00c1"
  instance_type = "t2.micro"
}
