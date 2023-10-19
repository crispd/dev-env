#!/bin/bash

SCRIPT_PATH="$(dirname "$(realpath $0)")/shell-aliases"

for i in "$SCRIPT_PATH/profile.d/"*; do
	if [ -f ~/.profile.d/$(basename "$i") ] && [ ! -h ~/.profile.d/$(basename "$i") ]; then
		mv ~/.profile.d/$(basename "$i") ~/.profile.d/$(basename "$i").bak
	fi
	ln -fns "$SCRIPT_PATH/profile.d/$(basename "$i")" "$HOME/.profile.d/$(basename "$i")"
done

source ~/.profile
