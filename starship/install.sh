#!/bin/bash

# Exit if cargo isn't installed yet
if [ ! -d ~/.cargo ]; then
	# cargo can provide installation of starship across everything I use
	echo "rust & cargo not installed. Re-run './install.sh lang' and try this again."
	exit 1
fi


# Only attempt to install starship if it hasn't been installed yet
if [ -e ~/.cargo/bin/starship ]
then
	echo "starship is already installed in ~/.cargo/bin/starship"
else
	cargo install starship --locked
	#curl -sS https://starship.rs/install.sh | sh
fi


# Make a backup of the ~/.profile.d/starship_prompt if it already exists and is a regular file
STARSHIP_INCLUDE_FILE="$HOME/.profile.d/starship_prompt"
if [ -e $STARSHIP_INCLUDE_FILE ] && [ -f $STARSHIP_INCLUDE_FILE ]; then
	mv $STARSHIP_INCLUDE_FILE "$STARSHIP_INCLUDE_FILE.bak"
fi
CURRENT_SHELL="$(basename $SHELL)"
ln -fns "$SCRIPT_PATH/starship/setup/$CURRENT_SHELL" "$HOME/.profile.d/starship_prompt"


# Construct the starship prompt defining .toml file, and put it to use.
source "$SCRIPT_PATH/starship/toml/construct.sh"
STARSHIP_PROMPT_DEF="$HOME/.config/starship.toml"
if [ -e $STARSHIP_PROMPT_DEF ] && [ -f $STARSHIP_PROMPT_DEF ]; then
	mv $STARSHIP_PROMPT_DEF "$STARSHIP_PROMPT_DEF.bak"
fi
ln -fns "$SCRIPT_PATH/starship/toml/starship.toml" "$HOME/.config/starship.toml"
