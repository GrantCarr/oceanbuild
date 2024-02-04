#!/bin/bash
apt update
apt upgrade -y
echo "-----------------------------------------------------------Setting SNMP"
apt install -y snmp snmpd snmp-mibs-downloader
sed -i 's/mibs :/# mibs :/g' /etc/snmp/snmp.conf
systemctl stop snmpd
cp -f ./oceansnmpd.conf /etc/snmp/snmpd.conf
systemctl restart snmpd
ufw allow 161/udp
ufw allow 162/udp


echo "-----------------------------------------------------------Adding user grant"
adduser --disabled-password --gecos "" grant
passwd grant
adduser grant sudo




