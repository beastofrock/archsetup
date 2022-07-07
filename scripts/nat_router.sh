#!/bin/bash
clear
echo "0" > /proc/sys/net/ipv4/ip_forward
iptables -X
iptables -F
iptables -t nat -F
sleep 4
ip a
echo ""
echo ""
echo "enter wan_interface: "
read wanif
modprobe ip_tables
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o $wanif -j MASQUERADE
iptables -t nat -L -v -n
echo ""
lsof -i -n -S -Pi
