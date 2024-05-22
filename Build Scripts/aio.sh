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
  echo "7. Node.js Latest"

  read -p "Enter the number for your choice: " node_choice

  case $node_choice in
    1) node_version="16" ;;
    2) node_version="17" ;;
    3) node_version="18" ;;
    4) node_version="19" ;;
    5) node_version="20" ;;
    6) node_version="lts" ;;
    7) node_version="node" ;;
    *) echo "Invalid choice"; exit 1 ;;
  esac

  sudo apt update
  sudo apt install -y build-essential checkinstall libssl-dev

  # Install nvm
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  source ~/.nvm/nvm.sh

  # Install the selected Node.js version
  nvm install $node_version
  nvm use $node_version
  nvm alias default $node_version

  echo "Node.js $node_version, npm, and nvm installed successfully."
}

# Function to install Java
install_java() {
  echo "Select Java version to install:"
  echo "1. OpenJDK 8"
  echo "2. OpenJDK 11"
  echo "3. OpenJDK 16"
  echo "4. OpenJDK 17"
  echo "5. OpenJDK Latest"

  read -p "Enter the number for your choice: " java_choice

  case $java_choice in
    1) java_version="openjdk-8-jdk" ;;
    2) java_version="openjdk-11-jdk" ;;
    3) java_version="openjdk-16-jdk" ;;
    4) java_version="openjdk-17-jdk" ;;
    5) java_version="default-jdk" ;;
    *) echo "Invalid choice"; exit 1 ;;
  esac

  sudo apt update
  sudo apt install -y $java_version
  echo "Java $java_version installed successfully."
}

# Function to install Python
install_python() {
  echo "Select Python version to install:"
  echo "1. Python 3.6"
  echo "2. Python 3.7"
  echo "3. Python 3.8"
  echo "4. Python 3.9"
  echo "5. Python 3.10"
  echo "6. Python Latest"

  read -p "Enter the number for your choice: " python_choice

  case $python_choice in
    1) python_version="python3.6" ;;
    2) python_version="python3.7" ;;
    3) python_version="python3.8" ;;
    4) python_version="python3.9" ;;
    5) python_version="python3.10" ;;
    6) python_version="python3" ;;
    *) echo "Invalid choice"; exit 1 ;;
  esac

  sudo apt update
  sudo apt install -y $python_version python3-pip
  echo "Python $python_version installed successfully."
}

# Function to install Ruby
install_ruby() {
  echo "Select Ruby version to install:"
  echo "1. Ruby 2.6"
  echo "2. Ruby 2.7"
  echo "3. Ruby 3.0"
  echo "4. Ruby 3.1"
  echo "5. Ruby Latest"

  read -p "Enter the number for your choice: " ruby_choice

  case $ruby_choice in
    1) ruby_version="2.6" ;;
    2) ruby_version="2.7" ;;
    3) ruby_version="3.0" ;;
    4) ruby_version="3.1" ;;
    5) ruby_version="ruby" ;;
    *) echo "Invalid choice"; exit 1 ;;
  esac

  sudo apt update
  sudo apt install -y software-properties-common
  sudo apt-add-repository -y ppa:brightbox/ruby-ng
  sudo apt update
  sudo apt install -y $ruby_version
  echo "Ruby $ruby_version installed successfully."
}

# Function to install Go
install_go() {
  echo "Select Go version to install:"
  echo "1. Go 1.16"
  echo "2. Go 1.17"
  echo "3. Go 1.18"
  echo "4. Go Latest"

  read -p "Enter the number for your choice: " go_choice

  case $go_choice in
    1) go_version="1.16.5" ;;
    2) go_version="1.17.1" ;;
    3) go_version="1.18" ;;
    4) go_version="latest" ;;
    *) echo "Invalid choice"; exit 1 ;;
  esac

  sudo apt update
  if [ "$go_version" = "latest" ]; then
    go_version=$(curl -s https://golang.org/VERSION?m=text)
  fi
  wget https://golang.org/dl/go$go_version.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go$go_version.linux-amd64.tar.gz
  echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
  source ~/.profile
  echo "Go $go_version installed successfully."
}

# Function to install PHP
install_php() {
  echo "Select PHP version to install:"
  echo "1. PHP 7.4"
  echo "2. PHP 8.0"
  echo "3. PHP 8.1"
  echo "4. PHP Latest"

  read -p "Enter the number for your choice: " php_choice

  case $php_choice in
    1) php_version="7.4" ;;
    2) php_version="8.0" ;;
    3) php_version="8.1" ;;
    4) php_version="php" ;;
    *) echo "Invalid choice"; exit 1 ;;
  esac

  sudo apt update
  sudo apt install -y software-properties-common
  sudo add-apt-repository -y ppa:ondrej/php
  sudo apt update
  sudo apt install -y $php_version
  echo "PHP $php_version installed successfully."
}

# Function to install Rust
install_rust() {
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  echo "Rust installed successfully."
}

# Function to install C#
install_csharp() {
  echo "Select .NET SDK version to install:"
  echo "1. .NET SDK 5.0"
  echo "2. .NET SDK 6.0"
  echo "3. .NET SDK 7.0"
  echo "4. .NET SDK Latest"

  read -p "Enter the number for your choice: " csharp_choice

  case $csharp_choice in
    1) csharp_version="5.0" ;;
    2) csharp_version="6.0" ;;
    3) csharp_version="7.0" ;;
    4) csharp_version="dotnet-sdk-latest" ;;
    *) echo "Invalid choice"; exit 1 ;;
  esac

  sudo apt update
  wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
  sudo apt update
  if [ "$csharp_version" = "dotnet-sdk-latest" ]; then
    sudo apt install -y dotnet-sdk-7.0  # Adjust to install the latest available SDK
  else
    sudo apt install -y dotnet-sdk-$csharp_version
  fi
  echo ".NET SDK $csharp_version installed successfully."
}

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
  4) install_ruby ;;
  5) install_go ;;
  6) install_php ;;
  7) install_rust ;;
  8) install_csharp ;;
  *) echo "Invalid choice"; exit 1 ;;
esac
