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

resource "aws_s3_object" "object" {
  for_each = tomap(var.bucket_object)
  bucket   = aws_s3_bucket.s3.id
  key      = each.object_key
  source   = each.object_path
  etag     = filemd5(each.object_path)
}