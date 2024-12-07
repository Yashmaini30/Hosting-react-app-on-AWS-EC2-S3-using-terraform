output "app_url" {
  value = "http://${aws_instance.react-vite-app.public_ip}"
}