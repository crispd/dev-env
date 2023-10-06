# .profile (shell profile management linked to from $HOME by dev-env scripts)
if [[ -d ~/.profile.d ]]; then
  for i in ~/.profile.d/*; do . $i; done
fi

# If user already has an ~/.aliases file, `install.sh aliases` will move it to .aliases.private so that it gets picked up here
if [[ -e ~/.aliases.private ]]; then
	. ~/.aliases.private
fi


