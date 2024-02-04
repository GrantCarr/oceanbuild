#!/bin/bash 
#

echo "-----------------------------------------------------------Setting SNMP"

apt install -y snmp snmpd snmp-mibs-downloader 

sed -i 's/mibs :/# mibs :/g' /etc/snmp/snmp.conf 

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
