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
# NOTE
#	Bash requires addition of `eval "$(starship init bash)"` to a dotfile like .bashrc (placed after addition of cargo envars)
#		But the line to add differs depending on shell used, and,
#		if scripting edits to an existing file like .bashrc, one would have to consider whether this line was already added in successive runs of this script. AND whether it was AFTER the line including cargo
#	Solution:
#		We have shell-specific files in a starship/setup/ folder.
#		Each one contains the correct starship-required line for the given shell, and has a filename that matches what "$(basename $SHELL)" will output for each shell.
# Get name of current shell
CURRENT_SHELL="$(basename $SHELL)"
# Make/reset a link in ~/.profile.d/ for the shell-appropriate starship-including file
ln -fns "$SCRIPT_PATH/starship/setup/$CURRENT_SHELL" "$HOME/.profile.d/include_starship_prompt"

# Construct the starship prompt defining .toml file, and put it to use.
#	I've chosen to use the bracketed-segments.toml preset, and prepend some extra customizations to it.
source "$SCRIPT_PATH/starship/toml/construct.sh"
STARSHIP_PROMPT_DEF="$HOME/.config/starship.toml"
if [ -e $STARSHIP_PROMPT_DEF ] && [ -f $STARSHIP_PROMPT_DEF ]; then
	mv $STARSHIP_PROMPT_DEF "$STARSHIP_PROMPT_DEF.bak"
fi
if [ ! -d ~/.config ]; then
	mkdir ~/.config
fi
ln -fns "$SCRIPT_PATH/starship/toml/starship.toml" "$HOME/.config/starship.toml"
