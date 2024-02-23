#!/bin/bash
apt update
apt upgrade -y
apt install -y curl git


echo "-----------------------------------------------------------Setting SNMP"
apt install -y snmp snmpd snmp-mibs-downloader
sed -i 's/mibs :/# mibs :/g' /etc/snmp/snmp.conf
systemctl stop snmpd
#cp -f ./oceansnmpd.conf /etc/snmp/snmpd.conf
#redo this as create a file or change this to a wget and then move it

echo "sysLocation    Ocean" > /etc/snmp/snmpd.conf
echo "sysContact     Me <me@example.org>" >> /etc/snmp/snmpd.conf
echo "sysServices    72" >> /etc/snmp/snmpd.conf
echo "master  agentx" >> /etc/snmp/snmpd.conf
echo "agentaddress udp:161,udp6:[::1]:161" >> /etc/snmp/snmpd.conf
echo "view   systemonly  included   .1.3.6.1.2.1.1" >> /etc/snmp/snmpd.conf
echo "view   systemonly  included   .1.3.6.1.2.1.25.1" >> /etc/snmp/snmpd.conf
echo "view   systemonly  included   .1.3.6.1.2.1" >> /etc/snmp/snmpd.conf
echo "view   systemonly  included   .1.3.6.1.4.1" >> /etc/snmp/snmpd.conf
echo "rocommunity  vinraystreet" >> /etc/snmp/snmpd.conf
echo "rocommunity6 vinraystreet" >> /etc/snmp/snmpd.conf
echo "" >> /etc/snmp/snmpd.conf
echo "includeDir /etc/snmp/snmpd.conf.d" >> /etc/snmp/snmpd.conf

systemctl restart snmpd
ufw allow 161/udp
ufw allow 162/udp


echo "-----------------------------------------------------------Adding user grant"
adduser --disabled-password --gecos "" grant
passwd grant
adduser grant sudo


echo "-----------------------------------------------------------Adding user ansible"
adduser --disabled-password --gecos "" ansible
passwd ansible
adduser ansible sudo


echo "-----------------------------------------------------------Setting sudo password override"
echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/allin

echo "-----------------------------------------------------------Expand Volumes if VM"
echo ""
df -h
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
echo ""
echo ""
echo ""
df -h


echo "-----------------------------------------------------------Setting Timezone"
timedatectl set-timezone Australia/Brisbane
timedatectl


echo "-----------------------------------------------------------hostname detail for DNS"
hostname
hostname -I


echo "-----------------------------------------------------------add to ansible server using"
echo ""
echo 'ssh-copy-id -i $HOME/.ssh/id_rsa.pub ansible@NEWSERVER.ocean.gkjml.com'
echo ""
echo ""

