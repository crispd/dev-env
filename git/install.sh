#!/bin/bash

#SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTPATH="$(dirname "$(realpath $0)")/git"

# Install git and hub using brew
sudo dnf install git -y

# Copy over bashrc.d contents
#  crispd: not used to using a bashrc directory, but it would be nice to clean up $HOME
#for i in "$(dirname "$0")/bashrc.d/"*; do
#  if [[ ! -e "~/.bashrc.d/$(basename "$i")" ]]; then
#    mv "~/.bashrc.d/$(basename "$i")" "~/.bashrc.d/$(basename "$i").bak"
#  fi
#  ln -fns "$i" "~/.bashrc.d/$(basename "$i")"
#done

# if config file exists & is not a symlink, move them to $i.bak and add symlink to dev-env version
if [ -e ~/.gitconfig ] && [ ! -h ~/.gitignore ]; then
  mv ~/.gitconfig ~/.gitconfig.bak
fi
#ln -fns "$(dirname "$0")/gitconfig" ~/.gitconfig
ln -fns "$SCRIPTPATH/gitconfig" ~/.gitconfig

if [ -e ~/.gitignore ] && [ ! -h ~/.gitignore ]; then
  mv ~/.gitignore ~/.gitignore.bak
fi
#ln -fns "$(dirname "$0")/gitignore" ~/.gitignore
ln -fns "$SCRIPTPATH/gitignore" ~/.gitignore

if ! git config --get user.name > /dev/null; then
  echo "DEV-ENV: Notice: No git username set! Add one via 'git config -f ~/.gitconfig.private --add user.name <Joe Schmo>'"
fi

if ! git config --get user.email > /dev/null; then
  echo "DEV-ENV: Notice: No git email set! Add one via 'git config -f ~/.gitconfig.private --add user.email <joe@schmo.com>'"
fi

