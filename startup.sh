#!/bin/bash
set -euxo pipefail

apt-get update
apt-get install -y ufw fail2ban unattended-upgrades apt-listchanges

# UFW
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

# SSH hardening
sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^#*X11Forwarding.*/X11Forwarding no/' /etc/ssh/sshd_config
sed -i 's/^#*MaxAuthTries.*/MaxAuthTries 3/' /etc/ssh/sshd_config
systemctl restart ssh || systemctl restart sshd

# Fail2ban
systemctl enable fail2ban
systemctl start fail2ban

# Auto updates
dpkg-reconfigure -plow unattended-upgrades

# Logging
echo "Startup script completed at $(date)" > /var/log/startup-complete.log
