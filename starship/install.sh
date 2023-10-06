#!/bin/bash

if [[ ! -d ~/.cargo ]]; then
	# cargo can provide installation of starship across everything I use
	echo "rust & cargo not installed. Re-run './install.sh lang' and try this again."
	exit 1
fi

if [[ -d ~/.cargo/bin/starship ]]
then
	echo "starship is already installed in ~/.cargo/bin/starship"
else
	cargo install starship --locked
	#curl -sS https://starship.rs/install.sh | sh
fi

if [[ -e ~/.profile.d/starship_prompt ]]; then
	mv ~/.profile.d/starship_prompt ~/.profile.d/starship_prompt.bak
fi

CURRENT_SHELL="$(basename $SHELL)"
ln -fns "$SCRIPT_PATH/starship/setup/$CURRENT_SHELL" "$HOME/.profile.d/starship_prompt"

source "$SCRIPT_PATH/starship/toml/construct.sh"
if [[ -e ~/.config/starship.toml ]]; then
	mv ~/.config/starship.toml ~/.config/starship.toml.bak
fi
ln -fns "$SCRIPT_PATH/starship/toml/starship.toml" "$HOME/.config/starship.toml"
