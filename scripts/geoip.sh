#!/bin/bash
cat geoip.sh

# maybe install iptables
# maybe install geoiplookup

# firewall-logging aktivieren 
# iptables -A INPUT -j LOG
# iptables -nvL

# download geoip-database....
# https://mailfud.org/geoip-legacy/GeoIP.dat.gz
# gunzip GeoIP.dat.gz
# filter ips
# grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
# sort
# uniq
# xargs -n 1 geoiplookup { } 
# sudo journalctl -k | grep "IN=.*OUT=.*" |  grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | sort | uniq | xargs -n 1 geoiplookup { } | sort | uniq -c | sort -n

