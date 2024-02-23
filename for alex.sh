#!/bin/bash
# I am assuming you created the pi owith a default user of alex - it could be pi or anything else- so change the paths below


#first know your ip address of the pi - look in your router's DHCP tables or use something like "Advanced IP scanner" software to find it

#then log into the pi using SSH 
# use your laptop or mac - fire up "terminal" and type in 
ssh alex@IPAddress  #the ip address given above.  sometimes windows hiccups here if you have had that IP address in your network before

# when your in check where you are
pwd #print working directory - should be something like /home/alex or /home/pi.  the second bit after /home/ is important for later.


#first create a directory where all the docker info will live

mkdir docker   # 

# pull down the software for curl and for git.  Curl just gets a file from the internet.  Git gets a while bunch of files from github which is a free code repository 
sudo apt install -y curl git

#pull down the docker library and install it
curl -fsSL https://get.docker.com -o ./docker/get-docker.sh  #downloads the get-docker script
sh ./docker/get-docker.sh  #executes this script (total assumption it is safe :-)

#make youself a docker admin with 
sudo adduser alex docker
#where alex is your pi username


#
#
#
# reboot the pi
#
#
#



#this next bit is optional but gives you a web inteface for managing docker
#mkdir ./docker/dockge
#
#
# there are so many ways to install a docker contain it is confusing.  The easiest (IMHO) is to use docker compose
# docker compose looks for a file called either docker-compose.yml or compose.yaml and uses it to download and create the container...
# yaml stands for "yet another markup language" - so Unix people DO have a sense of humor




# for wg-easy add the docker compose - open the attached wg-easy.yaml and copy all the lines
# pasting in Nano is a right click (mostly)
cd /home/alex/docker
mkdir wg-easy
cd wg-easy
nano compose.yaml
#past in the docker compse commands and change the variables

#then create the container
docker compose up -d #docker compose is the command, up is to bring the system up and -d means detach.  the -d means that if you close the 
# terminal window docker will not stop.

#in a web browser on your PC go to PI IP address: 51820







