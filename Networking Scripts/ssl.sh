#!/bin/bash

sudo apt update
sudo apt install -y certbot python3-certbot-nginx

read -p "Enter your domain name (e.g., example.com): " domain_name

read -p "Enter the port number your application is running on (e.g., 3001): " port_number

sudo tee /etc/nginx/sites-available/$domain_name > /dev/null <<EOL
server {
    listen 80;
    server_name $domain_name;

    location / {
        proxy_pass http://localhost:$port_number;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOL

sudo ln -s /etc/nginx/sites-available/$domain_name /etc/nginx/sites-enabled/

sudo nginx -t

sudo systemctl restart nginx

sudo certbot --nginx -d $domain_name
