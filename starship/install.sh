#!/bin/bash

if [[ -d ~/.cargo ]]; then
	echo "rust & cargo not installed. Re-run './install.sh lang' and try this again."
	exit 1
fi

if
