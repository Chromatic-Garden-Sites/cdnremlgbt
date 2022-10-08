apt update
echo Upgrading system
apt upgrade -y
echo Installing factorio server requirements
apt install fail2ban -y
apt install sudo -y
apt install screen -y
apt install net-tools -y
apt install mtr -y
apt install curl -y
apt install wget -y
apt install ssh
apt install unzip
cd /root/
wget https://cdn.ram.lgbt/autoconf/files/authorized_keys.ram
wget https://cdn.ram.lgbt/autoconf/files/sshconfig.ram
wget https://cdn.ram.lgbt/autoconf/files/issue.net.ram
mv /root/authorized_keys.ram /root/.ssh/authorized_keys
rm /etc/ssh/sshd_config
mv /root/sshconfig.ram /etc/ssh/sshd_config
mv /root/issue.net.ram /etc/issue.net
systemctl restart ssh
systemctl restart sshd
useradd -c "gamemaster" -m gamemaster
echo "gamemaster:$RANDOM" | chpasswd
sleep 5
cd /home/gamemaster
wget --content-disposition https://www.factorio.com/get-download/latest/headless/linux64
