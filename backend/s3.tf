#------------------------------
# s3_bucket
#------------------------------
resource "aws_s3_bucket" "remote" {
  bucket = "S3_BUCKET_NAME"
  lifecycle { prevent_destroy = true }

  tags = {
    Name        = "TAG_NANE"
    Environment = "ENV_NAME"
  }
}

#------------------------------
# s3_bucket_versioning
#------------------------------
resource "aws_s3_bucket_versioning" "remote_versioning" {
  bucket = aws_s3_bucket.remote.id

  versioning_configuration {
    status = "Enabled"
  }
}

#------------------------------
# s3_bucket_encryption
#------------------------------
resource "aws_s3_bucket_server_side_encryption_configuration" "remote_encription" {
  bucket = aws_s3_bucket.remote.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#------------------------------
# s3_bucket_access_block
#------------------------------
resource "aws_s3_bucket_public_access_block" "remote_accessblock" {
  bucket = aws_s3_bucket.remote.id

  block_public_acls       = true # 新規のパブリックACL作成を禁止
  block_public_policy     = true # 新規のパブリックバケットポリシーの適用を禁止
  ignore_public_acls      = true # 既存のパブリックACLを無視
  restrict_public_buckets = true # 既存のパブリックバケットポリシーを無視
}

#------------------------------
# s3_bucket_policy
#------------------------------
resource "aws_s3_bucket_policy" "remote_policy" {
  bucket = aws_s3_bucket.remote.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyDeleteBucketAndObjects"
        Effect    = "Deny"
        Principal = "*"
        Action = [
          "s3:DeleteBucket",
        ]
        Resource = [
          aws_s3_bucket.remote.arn
        ]
      }
    ]
  })
}