cd /root/
wget https://cdn.rem.lgbt/docker.sh
chmod a+x docker.sh
bash docker.sh
wget https://cdn.rem.lgbt/autoconf/glass/locations.json
wget https://cdn.rem.lgbt/autoconf/glass/dotenv
git clone https://github.com/KittensAreDaBest/glass
mv dotenv glass/.env
mv locations.json glass/config/locations.json
wget https://cdn.rem.lgbt/caddy.sh
chmod a+x caddy.sh
bash caddy.sh