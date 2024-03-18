#!/bin/bash
echo "----------------------------------------------ipinfo.io"
curl ipinfo.io
echo ""
echo ""
echo "----------------------------------------------nslookup"
nslookup google.com
echo ""
echo ""
echo "----------------------------------------------dnsleaktest"
/home/grant/dnsleaktest.sh
