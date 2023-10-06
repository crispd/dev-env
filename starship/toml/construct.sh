#!/bin/bash

# Overwrite existing .toml file, starting with customizations
# 	(maybe the other order makes more sense...?)
cat "$SCRIPT_PATH/starship/toml/customization.txt" > "$SCRIPT_PATH/starship/toml/starship.toml"
cat "$SCRIPT_PATH/starship/toml/bracketed-segments.txt" >> "$SCRIPT_PATH/starship/toml/starship.toml"
