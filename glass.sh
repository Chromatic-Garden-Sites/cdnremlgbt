cd /root/
wget https://cdn.7cs.to/docker.sh
chmod a+x docker.sh
bash docker.sh
wget https://cdn.7cs.to/autoconf/glass/locations.json
wget https://cdn.7cs.to/autoconf/glass/dotenv
git clone https://github.com/KittensAreDaBest/glass
mv dotenv glass/.env
mv locations.json glass/config/locations.json
wget https://cdn.7cs.to/caddy.sh
chmod a+x caddy.sh
bash caddy.sh