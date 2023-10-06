#!/bin/bash
# Example distros (so far, only LazyVim has an install script in this folder)
# 	LazyVim
# 	AstroVim
# 	NvChad
# 	...there are many others...

DIST_INSTALLS="$SCRIPT_PATH/nvims/dist-installs"

declare -a distros=("LazyVim")
for i in "${distros[@]}"
do
	#source "$DIST_INSTALLS/$i.sh" 2>&1 | tee -a "$DIST_INSTALLS/$i.log"
	source "$DIST_INSTALLS/$i.sh" 2>&1 | tee -a "$DIST_INSTALLS/$i.log"
done
