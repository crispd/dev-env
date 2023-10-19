#!/bin/bash

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
