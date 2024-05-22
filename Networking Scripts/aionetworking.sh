#!/bin/bash

# Function to install networking tools
install_network_tools() {
    # ... (existing code)
}

# Function to configure UFW for SSH
configure_ufw_ssh() {
    # ... (existing code)
}

# Function to get details of a specific port
get_port_details() {
    # ... (existing code)
}

# Function to configure SSL
configure_ssl() {
    echo "Enter the domain name for SSL configuration (e.g., subdomain.n0step.xyz):"
    read -p "Domain name: " domain_name

    # Update Nginx configuration
    sudo cat <<EOF > /etc/nginx/conf.d/nodejs.conf
server {
    listen 80;
    server_name $domain_name;
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

    echo "SSL configuration completed for domain $domain_name."
}

# Main menu
echo "Select the script to run:"
echo "1. Install networking tools"
echo "2. Configure UFW for SSH"
echo "3. Get port details"
echo "4. Configure SSL"

read -p "Enter the number for your choice: " choice

case $choice in
    1) install_network_tools ;;
    2) configure_ufw_ssh ;;
    3) read -p "Enter a port number: " port_number
       get_port_details "$port_number" ;;
    4) configure_ssl ;;
    *) echo "Invalid choice"; exit 1 ;;
esac
