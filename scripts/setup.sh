#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install necessary packages
sudo apt install -y curl git ufw fail2ban docker.io docker-compose

# Enable firewall
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

# Start and enable services
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Clone infra-core and start services
cd /opt
sudo git clone git@github.com:yourusername/infra-core.git
cd infra-core
sudo docker-compose up -d

echo "Setup complete! Core services are running."
