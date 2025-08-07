#!/bin/bash

# Ensure nginx is installed (skip if already installed)
if ! dpkg -l | grep -q nginx; then
  sudo apt update
  sudo apt install -y nginx
fi

# Ensure deployment directory exists
if [ ! -d /var/www/html ]; then
  sudo mkdir -p /var/www/html
fi

# Remove existing content from deployment directory
sudo rm -rf /var/www/html/*

