#!/bin/bash

apt-get update
apt-get install -y ufw fail2ban unattended-upgrades

ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

dpkg-reconfigure -plow unattended-upgrades

echo "Startup completed $(date)" >> /var/log/startup.log
