#!/bin/bash

echo "Installing Python"
sudo apt update
sudo apt install -y python3
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.12
echo "Python has been installed successfully."
