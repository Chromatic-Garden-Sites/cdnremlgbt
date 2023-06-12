apt update
apt install python3 -y
apt install python3-pip -y
curl https://repo.pathvector.io/pgp.asc > /usr/share/keyrings/pathvector.asc
echo "deb [signed-by=/usr/share/keyrings/pathvector.asc] https://repo.pathvector.io/apt/ stable main" > /etc/apt/sources.list.d/pathvector.list
apt update && apt install -y pathvector
wget https://cdn.rem.lgbt/autoconf/files/pathvector-default-config.rem
mv pathvector-default-config.rem /etc/pathvector.yml
echo Do not forget to install irrtree from pip - It is pip install irrtree dumbass
