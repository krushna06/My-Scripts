#!/bin/bash

# Install Nginx
sudo apt install nginx -y

# Configure Nginx
sudo nano /etc/nginx/conf.d/nodejs.conf <<EOF
server {
    listen 80;
    server_name webdrop.n0step.xyz;
    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Restart Nginx
sudo systemctl restart nginx

# Install Certbot
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot

# Obtain SSL certificate
sudo certbot --nginx

# Setup certificate renewal with cron
sudo crontab -l | { cat; echo "0 3 * * * sudo certbot renew >/dev/null 2>&1"; } | sudo crontab -
