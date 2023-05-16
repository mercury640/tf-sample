resource "aws_s3_bucket" "app_bucket" {
  
  bucket = var.bucket_name
  tags   = var.bucket_tag
  }

resource "aws_s3_bucket_public_access_block" "block_app_bucket" {
  
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = var.enable_block_public_acls
  block_public_policy     = var.enable_block_public_policy
  ignore_public_acls      = var.enable_ignore_public_acls
  restrict_public_buckets = var.enable_restrict_public_buckets
}

resource "aws_s3_bucket_policy" "allow_read_access" {
  bucket = aws_s3_bucket.app_bucket.id
  policy = data.aws_iam_policy_document.allow_read_access_policy_document.json
}

data "aws_iam_policy_document" "allow_read_access_policy_document" {
  statement {
    principals {
      type        = var.principals_type
      identifiers = var.principles_identifiers
    }
    actions = var.policy_actions

    resources = [
      "${aws_s3_bucket.app_bucket.arn}/*",
    ]
  }
}