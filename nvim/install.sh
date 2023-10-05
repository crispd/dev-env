#!/bin/bash

SCRIPTPATH="$(dirname "$(realpath $0)")/nvim"

# Install clang, rustup, bob
sudo dnf install clang

# Install rustup if it's not already installed
if [[ ! -d ~/.rustup ]]; then
	echo "DEV-ENV: Notice: rust language support rustup not found. Installing rustup (incl. cargo)."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


# Install bob if it's not already installed, then use it to install neovim
if [[ ! -d ~/.local/share/bob ]]; then
	cargo install --git https://github.com/MordechaiHadad/bob.git
fi

echo "DEV-ENV: Info: Now using 'bob' to install the stable release of neovim ('nvim')"
bob use stable


# Copy over profile.d contents
for i in "$SCRIPTPATH/profile.d/"*; do
  if [[ ! -e ~/.profile.d/$(basename "$i") ]]; then
    mv ~/.profile.d/$(basename "$i") ~/.profile.d/$(basename "$i").bak
  fi
  ln -fns "$SCRIPTPATH/profile.d/$(basename "$i")" "$HOME/.profile.d/$(basename "$i")"
done

