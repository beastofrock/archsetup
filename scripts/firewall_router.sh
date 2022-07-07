#!/bin/bash
echo "reset all...."

iptables -X
iptables -F
iptables -t nat -F

sleep 4
echo "install iptables, dnsmasq"
echo "dnsmasq working?"

wanif=enp1s0
lanif=enp7s0

echo "lanif: $lanif"
echo "wanif: $wanif"
echo ""
modprobe ip_tables
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "starting masquerading..."
iptables -t nat -A POSTROUTING -o $wanif -j MASQUERADE
echo ""
echo "for dnat:"
echo "dnat port 80 to internalip, with logging"
echo ""
wanip=192.168.0.218
lanip1=192.168.10.200
echo ""
echo "lanip: $lanip1"
echo "wanip: $wanip"
echo ""
echo "for logging first log-rule then the dnat"
iptables -t nat -A PREROUTING -p tcp --dport 80 -j LOG --log-prefix "DNAT_http_80: "
iptables -t nat -A PREROUTING -p tcp -d $wanip --dport 80 -j DNAT --to-destination $lanip1
echo ""
echo "no logging for ssh-port 10022"
iptables -t nat -A PREROUTING -p tcp -d $wanip --dport 10022 -j DNAT --to-destination $lanip1
echo ""
iptables -t nat -A PREROUTING -p tcp --dport 3389 -j LOG --log-prefix "DNAT_rdp_3389: "
iptables -t nat -A PREROUTING -p tcp -d $wanip --dport 3389 -j DNAT --to-destination $lanip1
echo ""
echo "log-port with no dnat"
iptables -t nat -A PREROUTING -p tcp --dport 3390 -j LOG --log-prefix "DNAT_haxor_3390: "
echo ""
iptables -t nat -L -v -n
echo ""
echo "for show logging: dmesg -w "
echo ""
echo ""
lsof -i
