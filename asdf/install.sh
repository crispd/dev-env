#!/bin/bash

# Install coreutils and git using brew
sudo dnf install git curl

# Install asdf if it's not already installed
if [[ ! -d ~/.asdf ]]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
  . ~/.asdf/asdf.sh
fi

# Copy over bashrc.d contents
for i in "$(dirname "$0")/bashrc.d/"*; do
  if [[ ! -e ~/.zshrc.d/$(basename "$i") ]]; then
    mv ~/.bashrc.d/$(basename "$i") ~/.bashrc.d/$(basename "$i").bak
  fi
  ln -fns "$i" ~/.bashrc.d/$(basename "$i")
done

