# Create a bucket for VPC flowlog 
## Create a bucket
resource "aws_s3_bucket" "bucket_flowlog" {
  bucket = var.bucket_flowlog

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true
    expiration {
      days = "30"
    }
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
## Block public access
resource "aws_s3_bucket_public_access_block" "private" {
  bucket                  = aws_s3_bucket.bucket_flowlog.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket.bucket_flowlog]
}
