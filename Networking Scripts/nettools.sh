#!/bin/bash

# Update package lists
sudo apt update

# Install networking tools
sudo apt install -y net-tools         # Package containing common networking tools like ifconfig, netstat, etc.
sudo apt install -y iproute2          # Advanced IP routing and network device configuration tools
sudo apt install -y iputils-ping      # Tool for testing network connections by sending ICMP echo requests
sudo apt install -y traceroute        # Tool for tracing the route packets take across an IP network
sudo apt install -y dnsutils          # Package containing DNS utilities like dig and nslookup
sudo apt install -y curl              # Command-line tool for transferring data with URL syntax
sudo apt install -y wget              # Command-line tool for downloading files from the web
sudo apt install -y whois             # Tool for querying WHOIS databases to obtain information about registered users of an Internet resource
sudo apt install -y nmap              # Network exploration and security auditing tool
sudo apt install -y tcpdump           # Network packet analyzer
sudo apt install -y wireshark         # Network protocol analyzer - GUI version
sudo apt install -y openssh-client    # Secure shell (SSH) client
sudo apt install -y openssh-server    # Secure shell (SSH) server
sudo apt install -y iptables          # Tool for IPv4 packet filtering and NAT
sudo apt install -y ipset             # Tool for managing IP sets
sudo apt install -y ncat              # Tool like netcat (nc) but with more features
sudo apt install -y socat             # Bidirectional data relay between two data channels
sudo apt install -y mtr-tiny          # Combines the functionality of traceroute and ping into one tool
sudo apt install -y inetutils-tools   # Collection of common networking utilities

echo "Networking tools installation complete."
