pacman -Syyu --noconfirm
pacman -S nano --noconfirm
pacman -S screen --noconfirm
pacman -S wget --noconfirm
pacman -S curl --noconfirm
pacman -S ssh --noconfirm
pacman -S unzip --noconfirm
pacman -S mtr --noconfirm
pacman -S neofetch --noconfirm
pacman -S cronie --noconfirm
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
