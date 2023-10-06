#!/bin/bash

FILE_TO_TEST="$HOME/.config/starship.toml"

if [ -e $FILE_TO_TEST ] && [ -f $FILE_TO_TEST ]; then
	echo "The following file exists and is a regular file"
	echo "$FILE_TO_TEST"
fi
