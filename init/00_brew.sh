#!/bin/bash

install_if_not_installed() {
  if ! brew ls --versions "$1" >/dev/null; then brew install "$1"; fi
}

if ! command -v brew >/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
install_if_not_installed zsh
install_if_not_installed tmux
install_if_not_installed vim
