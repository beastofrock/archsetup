#prompt
PS1='\[\e[m\]\n\[\e[0;1;92m\]\u\[\e[0m\]@\[\e[0;1;38;5;33m\]\H\[\e[m\] \[\e[0m\]|\[\e[0m\]\t\[\e[0m\]|\[\e[0m\]-\[\e[m\] \[\e[0m\]\w\[\e[m\] \[\e[0m\]|\[\e[0m\]|\[\e[m\] \[\e[0m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"')\[\e[m\]\n\[\e[0m\]-\[\e[0m\]-\[\e[0m\]>\[\e[0m\]:\[\e[0m\]\$\[\e[m\] \[\e[m\] \[\e0'
#prompt

alias ls='ls --color=auto'
alias ll='ls -lah'
alias cl='clear'
alias update='sudo pacman -Syuq --noconfirm'
alias sambamount='sh scripts/sambamount.sh'
alias uncomment='egrep -v "(^#.*|^$)"'
alias ssho='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1'
alias gohome='cd ~ ; pwd'
alias df1='df -h | grep dev/sd'
alias du1='du -lah --max-depth=1'
alias 1k='xrandr --output DVI-I-1 --scale 1x1 --panning 1920x1080'                                
alias 2k='xrandr --output DVI-I-1 --scale 1.2x1.2 --panning 2304x1296'
alias 4k='xrandr --output DVI-I-1 --scale 2x2 --panning 3840x2160'
alias getwindows='wmctrl -lG'
alias qemu-efi='qemu-system-x86_64 -m 4096 -smp 4 --enable-kvm -net nic -net bridge,br=br0 -bios /usr/share/ovmf/x64/OVMF.fd'
alias qemu-bios='qemu-system-x86_64 -m 4096 smp 4 --enable-kvm -net nic -net bridge,br=br0'
alias getyt='cd /home/user/Desktop; pwd; youtube-dl -f "bestvideo[height<=480]+bestaudio/best[height<=480]"'
alias funcrypt='openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -d '
alias fcrypt='openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt '

googleit() {
   xdg-open "http://google.com/search?q=$*"
}

update
clear

