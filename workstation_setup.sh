#!/bin/bash
sudo apt install software-properties-common python-software-properties curl build-essential dkms -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo add-apt-repository ppa:numix/ppa -y
sudo add-apt-repository ppa:noobslab/themes -y
sudo add-apt-repository ppa:noobslab/icons -y
sudo apt update
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
	unity-greeter \
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
	arc-theme \
	arc-icons \
	numix-icon-theme \
	numix-folders \
	numix-icon-theme-circle \
	numix-icon-theme-square \
	firefox \
	breeze-cursor-theme chameleon-cursor-theme dmz-cursor-theme oxygen-cursor-theme oxygen-cursor-theme-extra xcursor-themes \
	fonts-ubuntu-font-family-console ttf-ubuntu-font-family edubuntu-fonts \
	-y
git clone https://github.com/FortAwesome/Font-Awesome
git clone https://github.com/ryanoasis/nerd-fonts
mkdir ~/.fonts
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

