#!/bin/bash

# Add the OpenJDK PPA repository
sudo add-apt-repository -y ppa:openjdk-r/ppa

# Update package lists
sudo apt-get update

# Install OpenJDK 11
sudo apt install -y openjdk-11-jdk

echo "Java Development Kit (JDK) 11 has been installed successfully."
