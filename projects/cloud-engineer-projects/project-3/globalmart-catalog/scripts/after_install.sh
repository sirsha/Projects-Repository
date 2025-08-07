#!/bin/bash

# Update system packages (optional, but good practice)
sudo apt update -y

# Create a new Nginx config for the React app
sudo bash -c 'cat > /etc/nginx/sites-available/react-app << "EOL"
server {
    listen 80;
    server_name _;

    root /var/www/html;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }
}
EOL'

# Enable the new config and remove the default, if needed
sudo ln -sf /etc/nginx/sites-available/react-app /etc/nginx/sites-enabled/react-app
sudo rm -f /etc/nginx/sites-enabled/default

# Set correct permissions for the build directory
sudo chmod -R 755 /var/www/html

# Restart Nginx to apply changes
sudo systemctl restart nginx

