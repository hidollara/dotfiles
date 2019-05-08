#!/bin/bash

install_if_not_installed() {
  if ! brew ls --versions "$1" >/dev/null; then brew install "$1"; fi
}

install_if_not_installed zsh
install_if_not_installed tmux
install_if_not_installed vim

unset -f install_if_not_installed
