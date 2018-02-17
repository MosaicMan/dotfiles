#!/bin/bash

# Install Base Packages
sudo apt install software-properties-common python-software-properties curl build-essential dkms gnupg zip unzip -y

# Install Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.2.0/Hack.zip
mkdir ~/.local/share/fonts
unzip Hack.zip -d ~/.local/share/fonts/Hack
rm -f Hack.zip

# Add VS Code Repository
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Add Sublime Text Repository
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Add Google Chrome Repository
wget -qO - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Add PPAs
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo add-apt-repository ppa:numix/ppa -y
sudo add-apt-repository ppa:noobslab/themes -y
sudo add-apt-repository ppa:noobslab/icons -y

sudo apt update

# Install System Packages
sudo apt-get install \
	stow \
	neovim \
	tmux \
	zsh \
	htop \
	mercurial \
	git \
	python-pip \
	python3-pip \
	python-virtualenv \
	python3-virtualenv \
	virtualenvwrapper \
	software-properties-gtk \
	nodejs \
	lightdm \
	unity-greeter unity-greeter-badges \
	ubuntustudio-wallpapers \
	plymouth-theme-ubuntu-budgie-logo \
	i3 \
	i3blocks \
	rofi \
	mesa-utils \
	mesa-utils-extra \
	compton \
	xorg \
	xserver-xorg \
	thunar \
	gnome-terminal \
	lxappearance \
	feh \
	file-roller \
	seahorse seahorse-daemon \
	keepass2 \
	mono-xbuild cmake \
	arc-theme \
	arc-icons \
	numix-icon-theme \
	numix-folders \
	numix-icon-theme-circle \
	numix-icon-theme-square \
	firefox google-chrome-stable \
	breeze-cursor-theme chameleon-cursor-theme dmz-cursor-theme oxygen-cursor-theme oxygen-cursor-theme-extra xcursor-themes \
	fonts-font-awesome fonts-ubuntu-font-family-console ttf-ubuntu-font-family edubuntu-fonts \
	gedit gedit-plugins code sublime-text \
	-y

# Install OhMyZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Turn off git pager
sh -c "git config --global --replace-all core.pager cat"

# Pull Git submodules
sh -c "git submodule update --recursive --init vscode"

sudo cp 10_unity_greeter_background.gschema.override /usr/share/glib-2.0/schemas/.
sudo glib-compile-schemas /usr/share/glib-2.0/schemas

rm ~/.zshrc
nvim -c "quit"
nvim -c "PlugClean!" -c "quitall!"
nvim -c "PlugInstall" -c "quitall!"
/.local/share/nvim/plugged/YouCompleteMe/install.py --all

stow zsh
stow neovim
stow tmux
stow i3
stow vscode
stow wallpapers

