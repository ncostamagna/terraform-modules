resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(var.tags,
  tomap({ "Name" = var.bucket_name }))
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}