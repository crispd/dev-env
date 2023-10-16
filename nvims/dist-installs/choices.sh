#!/bin/bash
# Example distros (so far, only LazyVim has an install script in this folder)
# 	LazyVim
# 	AstroVim
# 	NvChad
# 	kickstart
# 	LunarVim
# 	*there are more...*

# This file's path
DIST_INSTALLS="$SCRIPT_PATH/nvims/dist-installs"

# List of distros to install (each must have an install script in $DIST_INSTALLS)
declare -a distros=("LazyVim")

# Run the install script for each distro in the list 'distros' from above.
# 	For each that is ran, ensure all output is captured in a logfile
# 	of name <distro>.log
for i in "${distros[@]}"
do
	#source "$DIST_INSTALLS/$i.sh" 2>&1 | tee -a "$DIST_INSTALLS/$i.log"
	source "$DIST_INSTALLS/$i.sh" 2>&1 | tee -a "$DIST_INSTALLS/$i.log"
done
