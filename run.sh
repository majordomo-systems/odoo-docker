#!/bin/bash
DESTINATION=$1
PORT=$2
# clone Odoo directory
git clone -b 12.0 https://github.com/majordomo-systems/odoo-docker.git $DESTINATION
rm -rf $DESTINATION/.git
# set permissions
mkdir -p $DESTINATION/postgresql
sudo chmod -R 777 $DESTINATION
# config
if grep -qF "fs.inotify.max_user_watches" /etc/sysctl.conf; then echo $(grep -F "fs.inotify.max_user_watches" /etc/sysctl.conf); else echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf; fi
sudo sysctl -p
sed -i 's/10012/'$PORT'/g' $DESTINATION/docker-compose.yml
# run Odoo
docker-compose -f $DESTINATION/docker-compose.yml up -d
cd odoo-docker*/addons
git clone https://github.com/OCA/rest-framework.git
docker exec --user root odoo-docker-1_odoo12_1 pip3 install wheel
# for GraphQL Module
docker exec --user root odoo-docker-1_odoo12_1 pip3 install graphql-server
docker exec --user root odoo-docker-1_odoo12_1 pip3 install graphql-server-core
docker exec --user root odoo-docker-1_odoo12_1 pip3 install graphene
docker exec --user root odoo-docker-1_odoo12_1 pip3 install -r /mnt/extra-addons/rest-framework/requirements.txt
# for OpenAPI Module
docker exec --user root odoo-docker-1_odoo12_1 pip3 install bravado-core
# set addon permissions and ownership
docker exec --user root odoo-docker-1_odoo12_1 chown -R odoo:odoo /mnt/extra-addons
docker exec --user root odoo-docker-1_odoo12_1 chmod -R 777 /mnt/extra-addons
# restart container
cd /root/odoo-docker
docker stop $(docker ps -aq)
docker-compose up -d

echo "Started Odoo @ http://localhost:10012"