mkdir /root/.ssh
cd /root/
curl https://cdn.ram.lgbt/autoconf/files/authorized_keys.ram
curl https://cdn.ram.lgbt/autoconf/files/sshconfig.ram
mv /root/authorized_keys.ram /root/.ssh/authorized_keys
rm /etc/ssh/sshd_config
mv /root/sshconfig.ram /etc/ssh/sshd_config
systemctl restart ssh
systemctl restart sshd
