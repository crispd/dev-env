#!/bin/bash

SCRIPT_PATH="$(dirname "$(realpath $0)")"
export DEVENV_INSTALL="$SCRIPT_PATH"

# Make sure things are updated
echo "######################################"
echo "------------- dnf update -------------"
echo "######################################"
dnf check-update -q && sudo dnf update -y -q


# Create ~/.profile.d directory if non-existant
if [ ! -d ~/.profile.d ]; then
	mkdir -p ~/.profile.d
fi


# Link dev-env's .profile file (which makes sure to iterate through ~/.profile.d)
if [ -e ~/.profile ]; then
	mv ~/.profile ~/.profile.bak
fi
ln -fns "$SCRIPT_PATH/.profile" ~/.profile

# If user already has an ~/.aliases file, this makes sure it will get picked up by ~/.profile
if [ -e ~/.aliases ]; then
	mv ~/.aliases ~/.aliases.private
fi


## DO INSTALLS
# If no plugins were passed, default to installing a basic set in order
if [ $# -eq 0 ]; then
  set -- git ssh base-toolset lang shell-aliases
fi


# Run all of the indicated plugins
for i; do
  echo ""
  # Make this look nicer...
  echo "#####################################"
  echo "---------- Installing ${i} ----------"
  echo "#####################################"
  source "$(dirname "$0")/${i}/install.sh"
done


source ~/.profile
