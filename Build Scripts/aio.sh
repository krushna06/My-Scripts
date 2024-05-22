#!/bin/bash

# Function to install Node.js
install_nodejs() {
  echo "Select Node.js version to install:"
  echo "1. Node.js v16"
  echo "2. Node.js v17"
  echo "3. Node.js v18"
  echo "4. Node.js v19"
  echo "5. Node.js v20"
  echo "6. Node.js LTS"

  read -p "Enter the number for your choice: " node_choice

  case $node_choice in
    1) node_version="16" ;;
    2) node_version="17" ;;
    3) node_version="18" ;;
    4) node_version="19" ;;
    5) node_version="20" ;;
    6) node_version="lts" ;;
    *) echo "Invalid choice"; exit 1 ;;
  esac

  sudo apt update
  sudo apt install -y nodejs npm

  # Install nvm
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  source ~/.bashrc

  # Install the selected Node.js version
  nvm install $node_version
  nvm use $node_version

  echo "Node.js $node_version, npm, and nvm installed successfully."
}

# Rest of your script (install_java and install_python functions) remains unchanged.

# Main menu
echo "Select the software to install:"
echo "1. Node.js"
echo "2. Java"
echo "3. Python"
echo "4. Ruby"
echo "5. Go"
echo "6. PHP"
echo "7. Rust"
echo "8. C#"

read -p "Enter the number for your choice: " choice

case $choice in
  1) install_nodejs ;;
  2) install_java ;;
  3) install_python ;;
  4) echo "Installing Ruby..." ;;  # Add Ruby installation logic here
  5) echo "Installing Go..." ;;    # Add Go installation logic here
  6) echo "Installing PHP..." ;;   # Add PHP installation logic here
  7) echo "Installing Rust..." ;;  # Add Rust installation logic here
  8) echo "Installing C#..." ;;    # Add C# installation logic here
  *) echo "Invalid choice"; exit 1 ;;
esac
