#!/bin/bash

SCRIPTPATH="$(dirname "$(realpath $0)")/ssh"

sudo dnf install openssh

# Ensure that ~/.ssh/ exists with the correct permissions
mkdir -m 700 -p ~/.ssh

## Copy over config
if [[ ! -e ~/.ssh/config ]]; then
  mv ~/.ssh/config ~/.ssh/config.bak
fi
#ln -fns "$(dirname "$0")/config" ~/.ssh/
ln -fns "$SCRIPTPATH/config" ~/.ssh/

# Check for the presence of an SSH key and add it to the keychain
if ! ssh-add -l &>/dev/null; then
  echo "No ssh key present! Add one via: 'ssh-keygen -t ed25519 -C <your_email@example.com>'"
  echo "    (Your comment doesn't HAVE to be your email)
fi

