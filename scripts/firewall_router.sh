#!/bin/bash
echo "install iptables, dnsmasq"
echo "dnsmasq working?"

wanif=enp1s0
lanif=enp7s0

echo "lanif: $lanif"
echo "wanif: $wanif"

modprobe ip_tables
echo "1" > /proc/sys/net/ipv4/ip_forward

echo "starting masquerading..."
iptables -t nat -A POSTROUTING -o $wanif -j MASQUERADE

echo "for dnat:"
echo "dnat port 80 to internalip, with logging"


wanip=192.168.0.218
lanip1=192.168.10.200

echo "lanip: $lanip1"
echo "wanip: $wanip"


iptables -t nat -A PREROUTING -p tcp --dport 80 -j LOG --log-prefix "DNAT_80: "
iptables -t nat -A PREROUTING -p tcp -d $wanip --dport 80 -j DNAT --to-destination $lanip1
iptables -t nat -A PREROUTING -p tcp -d $wanip --dport 10022 -j DNAT --to-destination $lanip1

iptables -t nat -L -v -n
