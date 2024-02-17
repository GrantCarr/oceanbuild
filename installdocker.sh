#!/bin/sh
mkdir /home/grant/docker 

curl -fsSL https://get.docker.com -o ./docker/get-docker.sh
sh ./docker/get-docker.sh

sudo adduser grant docker
sudo adduser ansible docker
