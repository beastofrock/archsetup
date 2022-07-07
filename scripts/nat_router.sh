#!/bin/bash
echo "enter wan_interface: "
read wanif
modprobe ip_tables
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o $wanif -j MASQUERADE
