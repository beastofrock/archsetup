echo "enter ip to ban: "
read ip
echo "banned ip is: "
echo $ip


#banip
iptables -A INPUT -s $ip -j DROP
#unbanip
#iptables -D INPUT -s <IP> -j DROP
#showbans
iptables -L INPUT
