#!/bin/bash

# Make sure things are updated
dnf check-update && sudo dnf update -y
sudo dnf install gawk -y

if [[ -e ~/.profile ]]; then
	echo "# ~/.profile" >> ~./profile
	echo "Made ~/.profile file"
fi
if [[ ! -d ~/.profile.d ]]; then
	mkdir -p ~/.profile.d
fi
#cat profile >> ~/.profile

FOR_TARGET="./profile"
TARGET="$HOME/.profile"
#target=datafile
awk -vtarget="$TARGET" 'FNR == NR { lines[$0] = 1; next }
                        ! ($0 in lines) {print >> target}' "$TARGET" "$FOR_TARGET"

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

