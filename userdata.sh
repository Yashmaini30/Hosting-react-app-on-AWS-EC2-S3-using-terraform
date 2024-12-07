#!/bin/bash
sudo yum update -y

# Install Node.js
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install -y nodejs

# Install serve globally
sudo npm install -g serve

# Unzip and serve the react App
sudo yum install -y unzip
mkdir -p /var/www/react-app
unzip /home/ec2-user/react-app.zip -d /var/www/react-app
serve -s /var/www/react-app/dist -l 80 &