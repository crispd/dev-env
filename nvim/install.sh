#!/bin/bash

# Install clang, rustup, bob
sudo dnf install clang

# Install rustup if it's not already installed
if [[ ! -d ~/.cargo ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


# Install bob if it's not already installed
if [[ ! -d ~/.local/share/bob ]]; then
  cargo install --git https://github.com/MordechaiHadad/bob.git
fi

bob use stable

# Copy over bashrc.d contents
for i in "$(dirname "$0")/bashrc.d/"*; do
  if [[ ! -e ~/.zshrc.d/$(basename "$i") ]]; then
    mv ~/.bashrc.d/$(basename "$i") ~/.bashrc.d/$(basename "$i").bak
  fi
  ln -fns "$i" ~/.bashrc.d/$(basename "$i")
done

