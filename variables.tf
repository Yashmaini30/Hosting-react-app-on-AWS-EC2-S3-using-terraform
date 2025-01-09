variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "hosting-react-on-s3"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "dist_path" {
  description = "Path to the React app's build directory"
  type        = string
  default     = "./my-react-app/dist"
}
