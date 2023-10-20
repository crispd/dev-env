#!/bin/bash

SCRIPT_PATH="$(dirname "$(realpath $0)")/base-toolset"

# Defining list of basic-tools (packages) to install
# No longer included here; krb5-workstation
packages=("curl" "gawk" "colordiff" "vim" "bat" "fd-find" "ripgrep" "htop" "fastfetch")

# Check if dnf is available (dnf-based systems)
if ! command -v dnf &> /dev/null; then
	echo "Error: dnf package manager isnot available on this system."
	exit 1
fi

# Update the package repositories (optional, but recommended)
dnf check-update && sudo dnf update -y

# Install the specified packages
for package in "${packages[@]}"; do
	if ! sudo dnf install -yq "$package"; then
		echo "Error: Failed to install $package."
		exit 1
	fi
done

echo "Packages installed successfully: ${packages[*]}"

for i in "$SCRIPT_PATH/profile.d/"*; do
	if [ -e "~/.profile.d/$(basename "$i")" ] && [ ! -h "~/.profile.d/$(basename "$i")" ]; then
		mv "~/.profile.d/$(basename "$i")" "~/.profile.d/$(basename "$i").bak"
	fi
	echo "Creating/updating symlink: ~/.profile.d/$(basename "$i")"
	ln -fns "$SCRIPT_PATH/profile.d/$(basename "$i")" "$HOME/.profile.d/$(basename "$i")"
done
