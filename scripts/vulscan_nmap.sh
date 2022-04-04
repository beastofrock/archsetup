
#!/bin/bash
cd /tmp
mkdir vultemp
cd vultemp
rm -rf scipag_vulscan
rm -rf nmap-vulners
git clone https://github.com/vulnersCom/nmap-vulners.git
git clone https://github.com/scipag/vulscan scipag_vulscan
nmap -sV --script=/tmp/vultemp//nmap-vulners/vulners.nse,/tmp/vultemp/scipag_vulscan/vulscan.nse localhost

