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
apt install ssh -y
apt install unzip -y
apt install python3-pip -y
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
useradd -c "gamemaster" -m gamemaster
echo "gamemaster:sHS4C7yetTjt963YDYmq7S9rTJazoDYKKvVTyFfuCYX" | chpasswd
sleep 5
cd /home/gamemaster
wget --content-disposition https://www.factorio.com/get-download/latest/headless/linux64 -O factorio.tar.xz
tar xf factorio.tar.xz
cd factorio/
wget https://cdn.7cs.to/autoconf/files/factorio-server-adminlist.ram
mv factorio-server-adminlist.ram server-adminlist.json
cd data/
wget https://cdn.7cs.to/autoconf/files/factorio-server-settings.ram
wget https://cdn.7cs.to/autoconf/files/factorio-map-gen-settings.ram
mv factorio-server-settings.ram server-settings.json
mv factorio-map-gen-settings.ram map-gen-settings.json
pip install requests
cd /home/gamemaster/factorio/bin/x64
wget --content-disposition https://raw.githubusercontent.com/narc0tiq/factorio-updater/master/update_factorio.py
chmod +x ./update_factorio.py
cd /home/gamemaster/factorio/bin/x64
./update_factorio.py -Dxa ./factorio
mkdir /home/gamemaster/factorio/saves
/home/gamemaster/factorio/bin/x64/factorio --create /home/gamemaster/factorio/saves/initial.zip --map-gen-settings /home/gamemaster/factorio/data/map-gen-settings.json
chown gamemaster:gamemaster /home/gamemaster -R
cd /etc/systemd/system
wget https://cdn.7cs.to/autoconf/files/factorio-service.ram
mv factorio-service.ram factorio.service
systemctl daemon-reload
systemctl enable factorio
systemctl start factorio
echo Done
