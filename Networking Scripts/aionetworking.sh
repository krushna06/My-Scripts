#!/bin/bash

# Function to install networking tools
install_network_tools() {
    # ... (existing code)
}

# Function to configure UFW for SSH
configure_ufw_ssh() {
    # Allow SSH port
    sudo ufw allow ssh

    # Whitelist commonly used ports
    sudo ufw allow 80     # HTTP
    sudo ufw allow 22     # SSH (already allowed above)
    sudo ufw allow 53     # DNS
    sudo ufw allow 123    # NTP

    # Enable UFW
    sudo ufw --force enable

    echo "UFW configured for SSH and popular ports."
}

# Function to get details of a specific port
get_port_details() {
    # ... (existing code)
}

# Main menu
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
