#!/bin/bash

# User defined Alias                                                                    
alias apt-get='sudo apt-get'                                                             
alias apt='sudo apt'                                                                    
alias nv='nvim'                                                                         
alias vim='nvim'                                                                        

# ls readability
alias ls='ls --color=auto -l'                                                           
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Human friendly disk and memory info
alias dfh='df -h'
alias duh='du -h --max-depth=1'
alias mem='free -h'
alias topu='top -o %CPU'        # sort top by CPU
alias topm='top -o %MEM'        # sort top by memory


#Ollama 
alias ai='ollama run Gemma3:1b'

alias bashrc='nvim ~/.bashrc'                                                           
alias nvimrc='cd ~/.config/nvim/'
alias aliases='nvim ~/.aliases.sh'

alias vo='cd /media/hawk0120/Voltron/'                                              
alias home='cd ~/'                                                                      
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias dev='cd ~/dev/'

###### Tools ######                                                  

#Restart Alias
alias restart='sudo reboot'

#Wifi connection
alias wl='nmcli device wifi list'
alias wc='nmcli device wifi connect'
alias wu='nmcli connect up'

#Git Alias
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'	
alias gb='git branch'
alias gpl='git pull'
alias gps='git push'
alias gcl='git clone'
alias glog='git log'
alias gdiff='git diff'
alias gmerge='git merge'
alias greset='git reset'
alias gf='git fetch'

# Docker Alias
alias vpn='docker run --init --rm -p 8118:8118 -p 9050:9050 dwightgunning/anonwebproxy:latest'

# Logs & monitoring
alias sv='systemctl'
alias watchsys='journalctl -f'
alias dmesg-f='dmesg --follow'

# Search files quickly
alias f='find . -iname'         # usage: f filename
alias grep='grep --color=auto'

# Brightnessctl
alias lmp='sudo brightnessctl s'
alias lmpM='sudo brightnessctl s 1060'
alias lmpm='sudo brightnessctl s  50'

# Clear
alias c='clear'

# Project Specific
alias tmr='echo "🧠 Building Thomas..." && gradle build -q && echo "🚀 Running..." && java -jar app/build/libs/app.jar'

