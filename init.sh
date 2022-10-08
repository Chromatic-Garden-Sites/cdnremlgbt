apt update
apt install sudo -y
apt install screen -y
apt install net-tools -y
apt install mtr -y
apt install curl -y
apt install wget -y
apt install ssh
apt install unzip
mkdir /root/.ssh
cd /root/
wget https://cdn.ram.lgbt/autoconf/files/authorized_keys.ram
wget https://cdn.ram.lgbt/autoconf/files/sshconfig.ram
mv /root/authorized_keys.ram /root/.ssh/authorized_keys
rm /etc/ssh/sshd_config
mv /root/sshconfig.ram /etc/ssh/sshd_config
systemctl restart ssh
systemctl restart sshd
