resource "aws_s3_object" "react_app_files" {
  for_each = fileset("${path.module}/my-react-app/dist", "**")

  bucket       = aws_s3_bucket.react_app_bucket.bucket
  key          = each.value
  source       = "${path.module}/my-react-app/dist/${each.value}"
  
  content_type = lookup(var.mime_types, try(regex("\\.[^.]+$", each.value)[0], ""), "application/octet-stream")
}
