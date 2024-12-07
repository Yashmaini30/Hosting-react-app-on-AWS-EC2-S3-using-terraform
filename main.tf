terraform {
  backend "s3"{
    bucket         = "practice-devops-tf-state"
    key            = "Hosting Ec2 Instance/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "react-vite-app" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name      = var.key_name
  security_groups = [aws_security_group.react_app_sg.name]

  user_data = file("userdata.sh")

  tags = {
    Name = "react-vite-app"
  }
}

resource "aws_security_group" "react_app_sg" {
  name        = "react_app_sg"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {  
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_public_ip" {
  value = aws_instance.react-vite-app.public_ip
}