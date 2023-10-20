#!/bin/bash

SCRIPTPATH="$(dirname "$(realpath $0)")/ssh"

sudo dnf install openssh

# Ensure that ~/.ssh/ exists with the correct permissions
mkdir -m 700 -p ~/.ssh

## Copy over config
if [ -e ~/.ssh/config ] && [ -f ~/.ssh/config ]; then
  mv ~/.ssh/config ~/.ssh/config.bak
fi
#ln -fns "$(dirname "$0")/config" ~/.ssh/
ln -fns "$SCRIPTPATH/config" ~/.ssh/

# Check for the presence of an SSH key and add it to the keychain
if ! ssh-add -l &>/dev/null; then
  echo "No ssh key present! Add one via: 'ssh-keygen -t ed25519 -C <your_email@example.com>'"
  echo "    (Your comment doesn't HAVE to be your email)"
fi

# THE KEY FILENAMES IN .ssh_agent MIGHT BE DIFFERENT FOR YOU, OR YOU MAY HAVE MORE THAN ONE
for i in "$SCRIPTPATH/profile.d/"*; do
	#echo "SCRIPTPATH: $SCRIPTPATH"
	#echo "CHECKING FOR: ~/.profile.d/$(basename "$i")"
	# If NOT EMPTY
	if [ -e "~/.profile.d/$(basename "$i")" ] && [ -f "~/.profile.d/$(basename "$i")" ]; then
		mv "~/.profile.d/$(basename "$i")" "~/.profile.d/$(basename "$i").bak"
	fi
	echo "Creating Symlink at: ~/.profile.d/$(basename "$i")"
	#echo "With this as source: $SCRIPTPATH/profile.d/$(basename "$i")"
	ln -fns "$SCRIPTPATH/profile.d/$(basename "$i")" "$HOME/.profile.d/$(basename "$i")"
done
