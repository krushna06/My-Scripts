#!/bin/bash

# Allow TELNET (TCP port 23)
sudo ufw allow 23/tcp

# Allow SMTP (TCP port 25)
sudo ufw allow 25/tcp

# Allow DNS (TCP and UDP port 53)
sudo ufw allow 53/tcp
sudo ufw allow 53/udp

# Allow DHCP (UDP ports 67 and 68)
sudo ufw allow 67/udp
sudo ufw allow 68/udp

# Allow HTTP (TCP port 80)
sudo ufw allow 80/tcp

# Allow POP3 (TCP port 110)
sudo ufw allow 110/tcp

# Allow Portmapper (TCP and UDP port 111)
sudo ufw allow 111/tcp
sudo ufw allow 111/udp

# Allow NTP (UDP port 123)
sudo ufw allow 123/udp

# Allow NetBIOS (TCP and UDP port 137)
sudo ufw allow 137/tcp
sudo ufw allow 137/udp

# Allow IMAP (TCP and UDP port 143)
sudo ufw allow 143/tcp
sudo ufw allow 143/udp

# Allow SNMP (UDP ports 161 and 162)
sudo ufw allow 161/udp
sudo ufw allow 162/udp

# Allow HTTPS (TCP port 443)
sudo ufw allow 443/tcp

# Allow IMAP over SSL (TCP port 993)
sudo ufw allow 993/tcp

# Enable UFW
sudo ufw enable

# Display UFW status
sudo ufw status verbose
