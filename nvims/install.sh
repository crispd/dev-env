#!/bin/bash

# Installing nvim distributions like LazyVim, AstroVim, NvChad, etc.
source "$SCRIPT_PATH/nvims/dist-installs/choices.sh"

# Anything in ~/.profile.d/ with the same name as what's in ./profile.d/ is backed up
# 	and a symlink is added to ~/.profile.d/ for each file found in ./profile.d/
for i in "$SCRIPT_PATH/nvims/profile.d/"*; do
	if [[ ! -e ~/.profile.d/$(basename "$i") ]]; then
		mv ~/.profile.d/$(basename "$i") ~/.profile.d/$(basename "$i").bak
	fi
	ln -fns "$SCRIPT_PATH/nvims/profile.d/$(basename "$i")" "$HOME/.profile.d/$(basename "$i")"
done

# Auto-source the new .profile for the current shell
source ~/.profile
