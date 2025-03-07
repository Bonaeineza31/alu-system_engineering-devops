#!/usr/bin/env bash
# This script configures Nginx to return a custom HTTP header with the server's hostname

# Update the package list and install Nginx
sudo apt update
sudo apt install -y nginx

# Modify the Nginx configuration to include the custom header
echo "server {
    listen 80;
    server_name bonaeineza.tech;

    location / {
        add_header X-Served-By \$hostname;
        try_files \$uri \$uri/ =404;
    }
}" | sudo tee /etc/nginx/sites-available/default

# Restart Nginx to apply the new configuration
sudo systemctl restart nginx

# Ensure Nginx is running
sudo systemctl status nginx

