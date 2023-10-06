#!/bin/bash
# Example distros (so far, only LazyVim has an install script in this folder)
# 	LazyVim
# 	AstroVim
# 	NvChad
# 	...there are many others...

declare -a distros=("LazyVim")
for i in "${distros[@]}"
do
	source "$i.sh" 2>&1 | tee -a $i.log
done
