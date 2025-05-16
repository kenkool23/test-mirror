resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "versioning_s3" {
  bucket = aws_s3_bucket.s3.id
  count  = var.enabled_versioning ? 1 : 0
  versioning_configuration {
    status = "Enabled"
  }
}
