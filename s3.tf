resource "aws_s3_bucket" "react_app_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "react_app_ownership_controls" {
  bucket = aws_s3_bucket.react_app_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"  # This ensures that only the bucket owner can access the objects
  }
}

resource "aws_s3_bucket_website_configuration" "react_app_website" {
  bucket = aws_s3_bucket.react_app_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_policy" "react_app_policy" {
  bucket = aws_s3_bucket.react_app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.react_app_bucket.arn}/*"
      }
    ]
  })
}


