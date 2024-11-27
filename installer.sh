#!/bin/bash
# Created: 2024-02-19
# Updated: 2024-11-27

############################################################################################################
# This script installs the following programs:
# 1. System Tools
# 2. Programming Languages and Tools
# 3. Communication and Entertainment
############################################################################################################

# Exits on error
set -e 

############################################
# System Tools
############################################

# Update and upgrade
sudo apt update
sudo apt upgrade

# Install git
sudo apt install git
echo 
"**************************************Git installed********************************************************"

# Install curl
sudo apt install curl
echo 
"**************************************Curl installed*******************************************************"
	
# Install tmux  - Not currently in use but not ready to remove from script - Nov 2024
# sudo apt install tmux
# echo "Tmux installed"

# Install i3
sudo apt install i3
echo 
"**************************************i3 installed*********************************************************"

# Install polybar
sudo apt install polybar
echo 
"*************************************polybar installed*****************************************************"


############################################
# Programming Languages and Tools 
############################################

# Install docker
sudo apt get install docker
echo
"************************************docker installed*******************************************************"

# Install neovim
if [ ~/$HOME/.nvim ]; then
    echo "Neovim is already installed"
else
    # Install neovim
    sudo apt install neovim 
		# Install neovim plugins
    nvim +PackerInstall +qall
    echo 
"************************************Neovim installed*******************************************************"
    cd ./.config/nvim/
		git clone -b master git@github.com:hawk0120/dotfiles.git
fi

# Remove default java and install java 17
sudo apt remove default-jdk default-jre
sudo apt install openjdk-17-jdk openjdk-17-jre 
echo 
"***********************************Java 17 installed*******************************************************"

# Install node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "Node.js installed"

# Install SdkMan
curl -s https://get.sdkman.io | bash
echo "Don't forget to restart your laptop so sdkman works"
sdk install kotlin

# Install VSCode - Not currently in use but not ready to remove from script - Nov 2024
# if [ -x "$(command -v code)" ]; then
# else
#     curl ttps://go.microsoft.com/fwlink/?LinkID=760868 -O code.deb
#     sudo dpkg -i code.deb
#     sudo apt install -f
#     rm code.deb
#     echo "VSCode installed"
# fi

# Install intelliJ Community
if [ -x "$(command -v intellij-idea-community)" ]; then
    echo "IntelliJ is already installed"
else
    wget https://download.jetbrains.com/product?code=IIC&latest&distribution=linux -O intellij.tar.gz
    sudo tar -xvf intellij.tar.gz -C /opt/
    rm intellij.tar.gz
    echo "IntelliJ installed"
fi



############################################
# Communication and Entertainment
############################################

# Install Google Chrome
if [ -x "$(command -v google-chrome)" ]; then
    echo "Google Chrome is already installed"
else
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt install -f
    rm google-chrome-stable_current_amd64.deb
    echo "Google Chrome installed"
fi

# Install Spotify
if [ -x "$(command -v spotify)" ]; then
    echo "Spotify is already installed"
else
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update
    sudo apt-get install spotify-client
    echo "Spotify installed"
fi

# Install Blueman
if [ -x "$(command -v blueman-manager)" ]; then
    echo "Blueman is already installed"
else
    sudo apt install blueman
    echo "Blueman installed"
fi

# Install VLC
if [ -x "$(command -v vlc)" ]; then
    echo "VLC is already installed"
else
    sudo apt install vlc
    echo "VLC installed"
fi


aliases=$(find -name aliases.sh) && cp -r $aliases ./
bashrc=$(find -name .bashrc) && cp -r $aliases ./
polybar=$(find -name polybar) && mv $polybar ./.config/
i3=$(find -name polybar) && mv $i3 ./.config/

