#!/bin/bash

NVIM_DISTRO="LazyVim"

if [[ -d ~/.config/$NVIM_DISTRO ]]; then
	echo "~/.config/$NVIM_DISTRO directory already exists. Skipping install of $NVIM_DISTRO."
	exit 1
fi

# Installation using LazyVim starter template:
# 	https://www.lazyvim.org/installation
# The ssh version of git clone here may change based on the user's ~/.ssh/config 
git clone https://github.com/LazyVim/starter ~/.config/$NVIM_DISTRO
#git clone git@github:LazyVim/starter ~/.config/$NVIM_DISTRO

rm -rf ~/.config/$NVIM_DISTRO/.git

# I'm guessing that the starter template runs some config on first call...
