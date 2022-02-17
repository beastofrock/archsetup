#install ipset 
#create zone in ipset
ipset -N poland hash:net

# remove any old list that might exist from previous runs of this script
rm pl.zone

# Pull the latest IP set for poland
wget -P . http://www.ipdeny.com/ipblocks/data/countries/pl.zone

# Add each IP address from the downloaded list into the ipset 'china'
for i in $(cat pl.zone ); do ipset -A poland $i; done

#activate Firewall
echo 'sudo iptables -A INPUT -p tcp -m set --match-set poland src -j DROP'
