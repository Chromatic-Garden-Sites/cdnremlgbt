#!/bin/bash
apt update
apt install syncplay -y
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
sleep 5
shutdown -r now
