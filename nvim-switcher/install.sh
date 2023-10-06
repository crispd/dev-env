#!/bin/bash

# Modified install of LazyVim for nvim-switcher
# 	*add others here if desired; like AstroVim, or NvChad*
if [[ ! -d ~/.config/LazyVim ]]; then
	git clone --depth 1 https://github.com/LazyVim/LazyVim ~/.config/LazyVim
fi

for i in "$SCRIPT_PATH/nvim-switcher/profile.d/"*; do
	if [[ ! -e ~/.profile.d/$(basename "$i") ]]; then
		mv ~/.profile.d/$(basename "$i") ~/.profile.d/$(basename "$i").bak
	fi
	ln -fns "$SCRIPT_PATH/nvim-switcher/profile.d/$(basename "$i")" "$HOME/.profile.d/$(basename "$i")"
done

. ~/.profile
