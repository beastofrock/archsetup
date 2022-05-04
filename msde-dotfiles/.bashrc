#prompt
PS1='\[\e[m\]\n\[\e[0;1;92m\]\u\[\e[0m\]@\[\e[0;1;38;5;33m\]\H\[\e[m\] \[\e[0m\]|\[\e[0m\]\t\[\e[0m\]|\[\e[0m\]-\[\e[m\] \[\e[0m\]\w\[\e[m\] \[\e[0m\]|\[\e[0m\]|\[\e[m\] \[\e[0m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"')\[\e[m\]\n\[\e[0m\]-\[\e[0m\]-\[\e[0m\]>\[\e[0m\]:\[\e[0m\]\$\[\e[m\] \[\e[m\] \[\e0'
#prompt

alias ls='ls --color=auto'
alias ll='ls -lah'
alias cl='clear'
alias uncomment='egrep -v "(^#.*|^$)"'
alias ssho='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1'
alias gohome='cd ~ ; pwd'
alias df1='df -h | grep dev/sd'
alias du1='du -lah --max-depth=1'
alias funcrypt='openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -d '
alias fcrypt='openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt '
alias isofolder='mkisofs -lJR -o cdrom.iso'
alias showfw='iptables -L -n -v ; iptables -t nat -L -n -v'

