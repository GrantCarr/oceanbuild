#!/bin/sh
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl

sudo adduser grant docker
sudo adduser ansible docker

mkdir docker && cd docker
mkdir dockge
# cp ./../dockge.yaml ./dockge/compose.yaml

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "---------------------------------------reboot before docker compose up -d"
echo ""
echo ""

