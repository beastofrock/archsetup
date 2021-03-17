#pacman -S iw hostapd wpa_supplicant wireless_tools iwd bridge-utils
###rename interface
ip link set wlp4s0 down
ip link set wlp4s0 name wlan0
ip link set wlan0 up
###/rename interface
ip link set enp3s0 down
ip link set enp3s0 name eth0
ip link set eth0 up
###test_wlan
###set_ip_address_gateway_etc
#ip link set eth0 up
#ip add add dev eth0 192.168.0.x/24
#ip route add default via 192.168.0.x
#echo nameserver 192.168.0.x > /etc/resolv.conf
###/set_ip_address_gateway_etc
###make_bridge_br0
ip link set eth0 down
#ip add del dev eth0 192.168.0.x/24
brctl addbr br0
brctl addif br0 eth0
#brctl addif br0 wlan0
ip link set eth0 up
ip link set br0 up
brctl show
ping google.de -c 1
#ip add add dev br0 192.168.0.x/24
#ip route add default via 192.168.0.x
#echo nameserver 192.168.0.x > /etc/resolv.conf
#iwctl
#station wlan0 scan
#station wlan0 get-networks
#station wlan0 connect SSID
###/test_wlan
###make_bridge_br0

/etc/hostapd/hostapd.conf:

interface=wlan0
#interface=br0
logger_syslog=-1
logger_syslog_level=2
logger_stdout=-1
logger_stdout_level=2
ctrl_interface=/run/hostapd
ctrl_interface_group=0
ssid=omg!!!test
hw_mode=g
channel=3
beacon_int=100
dtim_period=2
max_num_sta=255
rts_threshold=-1
fragm_threshold=-1
macaddr_acl=1
accept_mac_file=/etc/hostapd/accept
auth_algs=3
ignore_broadcast_ssid=0
wmm_enabled=1
wmm_ac_bk_cwmin=4
wmm_ac_bk_cwmax=10
wmm_ac_bk_aifs=7
wmm_ac_bk_txop_limit=0
wmm_ac_bk_acm=0
wmm_ac_be_aifs=3
wmm_ac_be_cwmin=4
wmm_ac_be_cwmax=10
wmm_ac_be_txop_limit=0
wmm_ac_be_acm=0
wmm_ac_vi_aifs=2
wmm_ac_vi_cwmin=3
wmm_ac_vi_cwmax=4
wmm_ac_vi_txop_limit=94
wmm_ac_vi_acm=0
wmm_ac_vo_aifs=2
wmm_ac_vo_cwmin=2
wmm_ac_vo_cwmax=3
wmm_ac_vo_txop_limit=47
wmm_ac_vo_acm=0
eapol_key_index_workaround=0
eap_server=0
#own_ip_addr=127.0.0.1
own_ip_addr=192.168.0.9



starting...
#!/bin/bash
sudo systemctl stop hostapd
sudo iw dev wlan0 set 4addr on
sudo brctl addif br0 wlan0
sudo brctl show br0
sudo systemctl start hostapd
sudo hostapd_cli


stoping...
#!/bin/bash
sudo systemctl stop hostapd
sudo brctl delif br0 wlan0
brctl show br0
