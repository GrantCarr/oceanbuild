#!/bin/sh
#
#
# wget https://raw.githubusercontent.com/GrantCarr/oceanbuild/main/installdockerdockge.sh
#
#

echo "----------------------------------------------install docker using help script"
mkdir /home/grant/docker 

curl -fsSL https://get.docker.com -o ./docker/get-docker.sh
sh ./docker/get-docker.sh

sudo adduser grant docker
sudo adduser ansible docker

echo "----------------------------------------------install dockge using docker compose up"
mkdir /home/grant/docker/dockge
#wget compose file
wget https://raw.githubusercontent.com/GrantCarr/oceanbuild/main/dockge.yaml
mv ./dockge.yaml /home/grant/docker/dockge/compose.yaml
# docker compose up -d - needs sudo as adduser won't have taken
sudo docker compose -f /home/grant/docker/dockge/compose.yaml up -d
#
echo ""
echo ""
echo hostname
echo hostname -I
echo ""
echo "----------------------------------------------dockge on port: 5001"
echo ""
echo ""
