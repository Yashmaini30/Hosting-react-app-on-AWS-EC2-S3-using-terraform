output "bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.react_app_website.website_endpoint
}
