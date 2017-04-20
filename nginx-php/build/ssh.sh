#!/bin/sh

set -e

# this one is secure, i double-checked
mv /build/configs/ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
chmod 0600 /etc/ssh/ssh_host_rsa_key

# Разрешение логиниться без паролей
echo "UsePAM no" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config

service ssh restart

# enable sshd
rm /etc/service/sshd/down
