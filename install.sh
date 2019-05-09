#!/bin/bash

DOTPATH="$HOME/.dotfiles"

if [[ "$OSTYPE" == linux* ]]; then
  if command -v apt >/dev/null; then
    sudo apt -y install build-essential curl file git
  elif command -v dnf >/dev/null; then
    sudo dnf -y groupinstall 'Development Tools' && sudo dnf -y install curl file git
  fi
fi
test -e "$DOTPATH" || git clone https://github.com/hidollara/dotfiles.git "$DOTPATH"
cd "$DOTPATH"
make deploy
make init
