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
apt install git -y
apt install bird2 -y
apt install gortr -y
apt install bgpq4 -y
apt install keepalived -y
apt install python3 -y
apt install python3-pip -y
curl https://repo.pathvector.io/pgp.asc > /usr/share/keyrings/pathvector.asc
echo "deb [signed-by=/usr/share/keyrings/pathvector.asc] https://repo.pathvector.io/apt/ stable main" > /etc/apt/sources.list.d/pathvector.list
apt update && apt install -y pathvector
wget https://cdn.rem.lgbt/autoconf/files/pathvector-default-config.rem
mv pathvector-default-config.rem /etc/pathvector.yml
mkdir /root/.ssh
mkdir /scripts
chmod 777 /scripts
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
cd /scripts/
wget https://cdn.ram.lgbt/autoconf/scripts/key-update.ram
mv key-update.ram key-update.sh
chmod a+x /scripts/key-update.sh
crontab -l > ramcron
echo "0 0 * * * /bin/bash /scripts/key-update.sh >/dev/null 2>&1" >> ramcron
crontab ramcron
rm ramcron
echo Do not forget to install irrtree from pip - It is pip install irrtree dumbass
