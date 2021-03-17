#pacman -S iw hostapd wpa_supplicant wireless_tools iwd
###rename interface
ip link set wlp4s0 down
ip link set wlp4s0 name wlan0
ip link set wlan0 up
###/rename interface
ip link set enp3s0 down
ip link set enp3s0 name wlan0
ip link set eth0 up
###test_wlan
###set_ip_address_gateway_etc
#ip link set eth0 up
#ip add add dev eth0 192.168.0.x/24
#ip route add default via 192.168.0.x
#echo nameserver 192.168.0.x > /etc/resolv.conf
###/set_ip_address_gateway_etc


#iwctl
#station wlan0 scan
#station wlan0 get-networks
#station wlan0 connect SSID
###/test_wlan
###make_bridge_br0


