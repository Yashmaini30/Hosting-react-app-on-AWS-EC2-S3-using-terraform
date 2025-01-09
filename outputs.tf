output "bucket_website_endpoint" {
  description = "The S3 bucket static website endpoint"
  value       = aws_s3_bucket.react_app_bucket.website_endpoint
}
