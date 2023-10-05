#!/bin/bash

if [[ ! -d ~/.profile.d ]]; then
	mkdir -p ~/.profile.d
fi
cat profile >> ~/.profile

# Make sure things are updated
dnf check-update && sudo dnf update -y


# If no plugins were passed, default to installing a basic set in order
if [ $# -eq 0 ]; then
  set -- git ssh basic-tools lang
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

