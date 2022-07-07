#!/bin/bash
clear
echo "reset all...."
iptables -X
iptables -F
iptables -t nat -F
sleep 4
clear
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
echo ""
wanip=192.168.0.218
realip1=192.168.10.200
echo ""
echo "wanip: $wanip"
echo "realip: $realip1"
echo ""
echo "for logging first log-rule then the dnat"
echo "dnat port 80 to internalip, with logging"
iptables -t nat -A PREROUTING -p tcp --dport 80 -j LOG --log-prefix "DNAT_http_80: "
iptables -t nat -A PREROUTING -p tcp -d $wanip --dport 80 -j DNAT --to-destination $realip1
echo ""
echo "dnat port ssh-port 10022 to internalip, without logging"
iptables -t nat -A PREROUTING -p tcp -d $wanip --dport 10022 -j DNAT --to-destination $realip1
echo ""
echo "dnap port 3389 to internalip, with logging"
iptables -t nat -A PREROUTING -p tcp --dport 3389 -j LOG --log-prefix "DNAT_rdp_3389: "
iptables -t nat -A PREROUTING -p tcp -d $wanip --dport 3389 -j DNAT --to-destination $realip1
echo ""
echo "log-port 3390 with no dnat"
iptables -t nat -A PREROUTING -p tcp --dport 3390 -j LOG --log-prefix "DNAT_haxor_3390: "
echo ""
iptables -t nat -L -v -n
echo ""
echo "for show logging: dmesg -w "
echo ""
echo ""
lsof -i
