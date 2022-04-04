
#!/bin/bash
cd ~
mkdir vultemp
cd vultemp
rm -rf scipag_vulscan
rm -rf nmap-vulners
git clone https://github.com/vulnersCom/nmap-vulners.git
git clone https://github.com/scipag/vulscan scipag_vulscan
nmap -sV --script=nmap-vulners/vulners.nse,scipag_vulscan/vulscan.nse localhost

