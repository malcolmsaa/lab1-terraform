#!/bin/bash
set -e

apt-get update -y
apt-get upgrade -y

apt-get install -y ufw fail2ban unattended-upgrades apt-listchanges

dpkg-reconfigure -f noninteractive unattended-upgrades

sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^#*X11Forwarding.*/X11Forwarding no/' /etc/ssh/sshd_config

systemctl restart ssh

ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

cat <<EOF > /etc/fail2ban/jail.local
[sshd]
enabled = true
port = ssh
logpath = /var/log/auth.log
maxretry = 5
bantime = 3600
EOF

systemctl enable fail2ban
systemctl restart fail2ban

echo "* hard core 0" >> /etc/security/limits.conf
echo "kernel.kptr_restrict=2" >> /etc/sysctl.conf
echo "kernel.dmesg_restrict=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter=1" >> /etc/sysctl.conf

sysctl -p

systemctl disable avahi-daemon || true
systemctl stop avahi-daemon || true

echo "Hardening complete at $(date)" > /var/log/startup-complete.log
