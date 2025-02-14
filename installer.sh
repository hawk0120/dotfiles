#!/bin/bash
# Created: 2024-02-19
# Updated: 2025-02-14
  
set -e  # Exit script on error

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

############################################
# System Tools
############################################

# Install git
if ! command -v git &>/dev/null; then
    sudo apt install -y git
    echo "Git installed"
else
    echo "Git is already installed"
fi

# Install curl
if ! command -v curl &>/dev/null; then
    sudo apt install -y curl
    echo "Curl installed"
else
    echo "Curl is already installed"
fi

# Install kitty
if ! command -v kitty &>/dev/null; then
    echo "Installing Kitty terminal..."
    sudo apt install -y kitty
    echo "Kitty installed"
else
    echo "Kitty is already installed"
fi

############################################
# Programming Languages and Tools
############################################

# Remove default Java and install Java 17
echo "Installing Java 17..."
sudo apt remove -y default-jdk default-jre
sudo apt install -y openjdk-17-jdk openjdk-17-jre 
echo "Java 17 installed"

# Install Node.js (latest LTS version)
NODE_LTS="20"
INSTALLED_NODE=$(node -v 2>/dev/null | cut -d "v" -f 2 | cut -d "." -f 1)

if [ "$INSTALLED_NODE" != "$NODE_LTS" ]; then
    echo "Installing Node.js $NODE_LTS..."
    curl -fsSL https://deb.nodesource.com/setup_$NODE_LTS.x | sudo -E bash -
    sudo apt install -y nodejs
    echo "Node.js $NODE_LTS installed"
else
    echo "Node.js is already up to date"
fi

############################################
# Communication and Entertainment
############################################

# Install VLC
if ! command -v vlc &>/dev/null; then
    echo "Installing VLC..."
    sudo apt install -y vlc
    echo "VLC installed"
else
    echo "VLC is already installed"
fi

# Install Blueman
if ! command -v blueman-manager &>/dev/null; then
    echo "Installing Blueman..."
    sudo apt install -y blueman
    echo "Blueman installed"
else
    echo "Blueman is already installed"
fi

############################################
# Rofi + Themes
############################################

if ! command -v rofi &>/dev/null; then
    echo "Installing Rofi..."
    sudo apt install -y rofi
    echo "Rofi installed"
else
    echo "Rofi is already installed"
fi

# Install Rofi Tokyonight Themes
echo "Installing Rofi Tokyonight themes..."
mv ~/.config/rofi ~/.config/rofi.bak || true
git clone git@github.com:w8ste/Tokyonight-rofi-theme.git ~/.config/rofi
sudo mv ~/.config/rofi/tokyonight.rasi /usr/share/rofi/themes
sudo mv ~/.config/rofi/tokyonight_big1.rasi /usr/share/rofi/themes
sudo mv ~/.config/rofi/tokyonight_big2.rasi /usr/share/rofi/themes
rm ~/.config/rofi/README.md
echo "Rofi Tokyonight themes installed"

############################################
# Install Calibre
############################################

echo "Installing Calibre..."
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
echo "Calibre installed"

############################################
# Clone and move dotfiles repository
############################################

DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone git@github.com:hawk0120/dotfiles.git "$DOTFILES_DIR"
    echo "Dotfiles repository cloned"
else
    echo "Dotfiles repository already exists"
fi

if [ -d "$DOTFILES_DIR" ]; then
    echo "Moving dotfiles..."
    cp -r "$DOTFILES_DIR/.bashrc" "$HOME/"
    cp -r "$DOTFILES_DIR/.aliases.sh" "$HOME/"
    cp -r "$DOTFILES_DIR/.gitconfig" "$HOME/"
    cp -r "$DOTFILES_DIR/nvim" "$HOME/.config/"
    echo "Dotfiles moved to home directory"
else
    echo "Failed to clone the repository"
fi

rm -rf "$DOTFILES_DIR"

echo "Script completed successfully!"
