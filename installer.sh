#!/bin/bash
# Created: 2024-02-19
# Updated: 2025-02-11
  
############################################################################################################
# This script installs the latest versions of the following programs:
# 1. System Tools
# 2. Programming Languages and Tools
# 3. Communication and Entertainment
############################################################################################################

set -e  # Exit on error

############################################
# System Tools
############################################

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Install git
if ! command -v git &> /dev/null; then
    sudo apt install -y git
    echo "Git installed"
else
    echo "Git is already installed"
fi

# Install curl
if ! command -v curl &> /dev/null; then
    sudo apt install -y curl
    echo "Curl installed"
else
    echo "Curl is already installed"
fi

# Install Neovim
if ! command -v nvim &> /dev/null; then
    sudo apt install -y neovim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    nvim +PackerSync +qall
    echo "Neovim installed"
else
    echo "Neovim is already installed"
    nvim +PackerSync +qall
fi

############################################
# Programming Languages and Tools
############################################

# Remove default Java and install the latest OpenJDK
sudo apt remove -y default-jdk default-jre
sudo apt install -y openjdk-21-jdk openjdk-21-jre
java -version
echo "Latest Java installed"

# Install the latest Node.js
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs
node -v
npm -v
echo "Latest Node.js installed"

# Install IntelliJ Community Edition
if ! command -v intellij-idea-community &> /dev/null; then
    wget -O intellij.tar.gz https://download.jetbrains.com/product?code=IIC&latest&distribution=linux
    sudo tar -xvf intellij.tar.gz -C /opt/
    rm intellij.tar.gz
    echo "IntelliJ installed"
else
    echo "IntelliJ is already installed"
fi

############################################
# Communication and Entertainment
############################################

# Install Microsoft Teams
if ! command -v teams &> /dev/null; then
    wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.13653_amd64.deb
    sudo dpkg -i teams_1.4.00.13653_amd64.deb || sudo apt install -f -y
    rm teams_1.4.00.13653_amd64.deb
    echo "Microsoft Teams installed"
else
    echo "Microsoft Teams is already installed"
fi

# Install Zoom
if ! command -v zoom &> /dev/null; then
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo dpkg -i zoom_amd64.deb || sudo apt install -f -y
    rm zoom_amd64.deb
    echo "Zoom installed"
else
    echo "Zoom is already installed"
fi

# Install Spotify
if ! command -v spotify &> /dev/null; then
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update && sudo apt install -y spotify-client
    echo "Spotify installed"
else
    echo "Spotify is already installed"
fi

# Install Blueman
if ! command -v blueman-manager &> /dev/null; then
    sudo apt install -y blueman
    echo "Blueman installed"
else
    echo "Blueman is already installed"
fi

# Install VLC
if ! command -v vlc &> /dev/null; then
    sudo apt install -y vlc
    echo "VLC installed"
else
    echo "VLC is already installed"
fi

# Install Adobe Acrobat Reader
if ! command -v acrordrdc &> /dev/null; then
    sudo snap install acrordrdc
    echo "Adobe Acrobat Reader installed"
else
    echo "Adobe Acrobat Reader is already installed"
fi

############################################
# Clone and move dotfiles repository
############################################

if [ ! -d ~/dotfiles ]; then
    git clone git@github.com:hawk0120/dotfiles.git ~/dotfiles
    echo "Dotfiles repository cloned"
else
    echo "Dotfiles repository already exists"
fi

if [ -d ~/dotfiles ]; then
    cp -r ~/dotfiles/.bashrc ~/
    cp -r ~/dotfiles/.aliases.sh ~/
    cp -r ~/dotfiles/.gitconfig ~/
    cp -r ~/dotfiles/nvim ~/
    echo "Dotfiles moved to home directory"
else
    echo "Failed to clone the repository"
fi

# Clean up
rm -rf ~/dotfiles

echo "Script completed successfully"
