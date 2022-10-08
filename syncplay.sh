#!/bin/bash
apt update
echo Installing stuff that should have been installed in the first place
sleep 1
apt install sudo -y
apt install screen -y
apt install net-tools -y
apt install mtr -y
apt install curl -y
apt install wget -y
apt install ssh
apt install unzip
echo Loading keys and setting up SSH
sleep 1
mkdir /root/.ssh
cd /root/
wget https://cdn.ram.lgbt/autoconf/files/authorized_keys.ram
wget https://cdn.ram.lgbt/autoconf/files/sshconfig.ram
wget https://cdn.ram.lgbt/autoconf/files/issue.net.ram
mv /root/authorized_keys.ram /root/.ssh/authorized_keys
rm /etc/ssh/sshd_config
mv /root/sshconfig.ram /etc/ssh/sshd_config
mv /root/issue.net.ram /etc/issue.net
echo Disabling password authentication
systemctl restart ssh
systemctl restart sshd
apt install syncplay-server -y
apt install certbot -y
echo Please enter the domain name for syncplay
read domainname
echo Please enter the certificate email
read certificateemail
echo Please enter port number for syncplay
read portnumber
certbot certonly --rsa-key-size 2048 --standalone --agree-tos --no-eff-email --email $certificateemail -d $domainname
cd /root/
echo "syncplay-server --tls /etc/letsencrypt/live/$domainname --salt ZUVVLSVJMZ --port $portnumber" > syncplay-init.sh
chmod a+x /root/syncplay_init.sh
crontab -l > mycron
echo "@reboot /bin/bash /root/syncplay-init.sh" >> mycron
crontab mycron
rm mycron
echo Done, Rebooting in 5 seconds
shutdown -r now
shutdown -r now
