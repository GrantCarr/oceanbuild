#!/bin/sh
apt update
apt upgrade -y
apt install -y curl


mkdir /home/grant/docker && cd /home/grant/docker
mkdir dockge
chown -R grant:grant /home/grant/docker

cp dockge.yaml /home/grant/docker.dockge/compose.yaml
chown grant:grant ./dockge/compose.yaml


curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

adduser grant docker
adduser ansible docker



echo "---------------------------------------reboot before docker compose up -d"
echo ""
echo ""

