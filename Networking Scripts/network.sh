#!/bin/bash

install_network_tools() {
    sudo apt update
    sudo apt install -y net-tools dnsutils curl wget
    echo "Networking tools installed."
}

configure_ufw_ssh() {
    sudo ufw allow ssh
    sudo ufw allow 80
    sudo ufw allow 22
    sudo ufw allow 53
    sudo ufw allow 123
    sudo ufw --force enable
    echo "UFW configured for SSH and popular ports."
}

get_port_details() {
    sudo netstat -tulnp | grep ":$1"
}

echo "Select the script to run:"
echo "1. Install networking tools"
echo "2. Configure UFW for SSH"
echo "3. Get port details"

read -p "Enter the number for your choice: " choice

case $choice in
    1) install_network_tools ;;
    2) configure_ufw_ssh ;;
    3) read -p "Enter a port number: " port_number
       get_port_details "$port_number" ;;
    *) echo "Invalid choice"; exit 1 ;;
esac
