apt update
apt install sudo -y
apt install screen -y
apt install net-tools -y
apt install mtr -y
apt install curl -y
apt install wget -y
apt install ssh -y
apt install unzip -y
apt install htop -y
apt install nano -y
apt install systemd-cron -y
apt install git -y
apt install wireguard -y
mkdir /root/.ssh
mkdir /scripts
chmod 777 /scripts
cd /root/
wget https://cdn.7cs.to/autoconf/files/authorized_keys.ram
wget https://cdn.7cs.to/autoconf/files/sshconfig.ram
wget https://cdn.7cs.to/autoconf/files/issue.net.ram
mv /root/authorized_keys.ram /root/.ssh/authorized_keys
rm /etc/ssh/sshd_config
mv /root/sshconfig.ram /etc/ssh/sshd_config
mv /root/issue.net.ram /etc/issue.net
systemctl restart ssh
systemctl restart sshd
cd /scripts/
wget https://cdn.7cs.to/autoconf/scripts/key-update.ram
mv key-update.ram key-update.sh
chmod a+x /scripts/key-update.sh
crontab -l > ramcron
echo "0 0 * * * /bin/bash /scripts/key-update.sh >/dev/null 2>&1" >> ramcron
crontab ramcron
rm ramcron
