#!/bin/bash

# Dependencies installation
sudo apt-get update && sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
     vim \
     fail2ban \
     ntfs-3g

# Get Docker repo signed keys
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Add Docker repo to sources
echo "deb [arch=`dpkg --print-architecture`] https://download.docker.com/linux/debian \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

# Docker installation
sudo apt-get update && sudo apt-get install -y --no-install-recommends docker-ce docker-compose

# Add user to docker group
sudo usermod -a -G docker $USER

echo "IMPORTANT: Must logout and then login to start using Docker."