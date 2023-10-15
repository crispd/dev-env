#!/bin/bash

# Defining list of basic-tools (packages) to install
packages=("clang" "gcc" "cmake" "python3" "python3-pip" "ShellCheck")

# Check if dnf is available (dnf-based systems)
if ! command -v dnf &> /dev/null; then
	echo "DEV-ENV: Error: dnf package manager isnot available on this system."
	exit 1
fi

# Update the package repositories (optional, but recommended)
dnf check-update && sudo dnf update -y

# Install the specified packages
for package in "${packages[@]}"; do
	if ! sudo dnf install -y "$package"; then
		echo "DEV-ENV: Error: Failed to install $package."
		exit 1
	fi
done

# Rustup install will add rust language support and it's package manager cargo
echo "DEV-ENV: Info: Non-Rust Packages installed successfully: ${packages[*]}"

if [[ ! -d ~/.rustup ]]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source "$HOME/.cargo/env"
	echo "DEV-ENV: Info: The ~/.cargo/env file has been sourced in the current shell."
fi
