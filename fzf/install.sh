#!/bin/bash

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# There will be more, to include fd & bat
for i in "$SCRIPT_PATH/fzf/profile.d/"*; do
	if [ -e ~/.profile.d/$(basename "$i") ]; then
		mv ~/.profile.d/$(basename "$i") ~/.profile.d/$(basename "$i").bak
	fi
	ln -fns "$SCRIPT_PATH/fzf/profile.d/$(basename "$i")" "$HOME/.profile.d/$(basename "$i")"
done

