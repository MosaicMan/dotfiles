#!/bin/bash
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt-get install -y \
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
	nodejs \
	lightdm \
	unity-greeter \
	i3 \
	i3blocks \
	mesa-utils \
	mesa-utils-extra \
	compton \
	xorg \
	xserver-org \
	thunar \
	gnome-terminal \
	lxappearance \
	feh \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
