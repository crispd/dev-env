#!/bin/bash

# Install git and hub using brew
sudo dnf install git -y

# Copy over zshrc.d contents
#for i in "$(dirname "$0")/bashrc.d/"*; do
#  if [[ ! -e "~/.bashrc.d/$(basename "$i")" ]]; then
#    mv "~/.bashrc.d/$(basename "$i")" "~/.bashrc.d/$(basename "$i").bak"
#  fi
#  ln -fns "$i" "~/.bashrc.d/$(basename "$i")"
#done

# Copy over config files
if [[ ! -e ~/.gitconfig ]]; then
  mv ~/.gitconfig ~/.gitconfig.bak
fi
ln -fns "$(dirname "$0")/gitconfig" ~/.gitconfig

if [[ ! -e ~/.gitignore ]]; then
  mv ~/.gitignore ~/.gitignore.bak
fi
ln -fns "$(dirname "$0")/gitignore" ~/.gitignore

if ! git config --get user.name > /dev/null; then
  echo "No git username set! Add one via 'git config -f ~/.gitconfig.private --add user.name <Joe Schmo>'"
fi

if ! git config --get user.email > /dev/null; then
  echo "No git email set! Add one via 'git config -f ~/.gitconfig.private --add user.email <joe@schmo.com>'"
fi

