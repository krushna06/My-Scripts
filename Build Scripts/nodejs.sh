#!/bin/bash

# Update package lists
sudo apt update

# Install Node.js
sudo apt install nodejs

# Install npm
sudo apt install npm

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Prompt to install a new Node.js version
echo "To install a new Node.js version, run: nvm install 16 && nvm use 16"

# Success message
echo "Node.js, npm & nvm installed successfully."
