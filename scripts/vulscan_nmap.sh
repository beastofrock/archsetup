cd ~
mkdir vultemp
cd vultemp
git clone https://github.com/vulnersCom/nmap-vulners.git
git clone https://github.com/scipag/vulscan scipag_vulscan
nmap -sV --script=nmap-vulners/vulners.nse,scipag_vulscan/vulscan.nse localhost

