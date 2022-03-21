#!/bin/bash
echo "download geoip-database....

wget https://mailfud.org/geoip-legacy/GeoIP.dat.gz
gunzip GeoIP.dat.gz
"

echo "filter ips"

echo 
'cat data.txt | 
grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
'

sort
uniq
