#!/bin/bash
#echo 'sudo journalctl -k | grep "IN=.*OUT=.*" for firwewall'
#echo "logfile? "
#read logfile
# download geoip-database....
# https://mailfud.org/geoip-legacy/GeoIP.dat.gz
# gunzip GeoIP.dat.gz
# filter ips
#cat $logfile | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
#sort
#uniq
#cat ./ip_test.txt | sort | uniq | xargs -n 1 geoiplookup { } 

echo "
sudo journalctl -k | grep "IN=.*OUT=.*" |  grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | sort | uniq | xargs -n 1 geoiplookup { } | sort | uniq -c | sort -n
"
