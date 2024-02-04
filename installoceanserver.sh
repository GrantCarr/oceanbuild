#! /usr/bin/bash
apt update
apt upgrade -y
#
echo "-----------------------------------------------------------Setting SNMP"
apt install -y snmp snmpd snmp-mibs-downloader libnet-snmp-perl snmptrapd
sed -i 's/mibs :/# mibs :/g' /etc/snmp/snmp.conf
#sed -i '/^[^#]/ s/\(^.*agentaddress.*$\)/#\ \1/' /etc/snmp/snmpd.conf
#echo "agentaddress udp:161,udp6:[::1]:161" > /etc/snmp/snmpd.conf.d/allin.conf
#echo "view   systemonly  included   .1.3.6.1.2.1" >> /etc/snmp/snmpd.conf.d/allin.conf
#echo "view   systemonly  included   .1.3.6.1.4.1" >> /etc/snmp/snmpd.conf.d/allin.conf
systemctl stop snmpd
cp -f ./oceansnmpd.conf /etc/snmp/snmpd.conf 
systemctl restart snmpd
ufw allow 161/udp
ufw allow 162/udp
#
#
echo "-----------------------------------------------------------Adding grant"
adduser --disabled-password --gecos "" grant
passwd grant
adduser grant sudo
#
echo "-----------------------------------------------------------Adding ansible"
adduser --disabled-password --gecos "" ansible
passwd ansible
adduser ansible sudo
#
echo "-----------------------------------------------------------Setting sudo password override"
echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/allin
#
echo "-----------------------------------------------------------Setting Timezone"
timedatectl set-timezone Australia/Brisbane
timedatectl
#
echo "-----------------------------------------------------------hostname detail for DNS"
hostname
hostname -I
#install pihole
# curl -sSL https://install.pi-hole.net | bash
#change pihole password
# pihole -a -p
#install gravity-sync
# curl -sSL https://raw.githubusercontent.com/vmstan/gs-install/main/gs-install.sh | bash
#
#
#install ansible on ansibleocean
#   ssh-copy-id -i $HOME/.ssh/id_rsa.pub ansible@NEWSERVER.local
#
#ubuntu VM - expand volume
# lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
# resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

