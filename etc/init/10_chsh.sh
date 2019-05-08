#!/bin/bash

zsh_path=$(which zsh)
shells_file='/etc/shells'

case "$OSTYPE" in
  darwin* )
    if [[ $(dscl . -read /Users/$USER UserShell | cut -d' ' -f2) != $zsh_path ]]; then
      sudo dscl . -create /Users/$USER UserShell /usr/local/bin/bash
    fi
    ;;
  linux-* )
    if [[ $(grep $USER /etc/passwd | cut -d: -f7) != $zsh_path ]]; then
      cat $shells_file | grep $zsh_path >/dev/null || echo $zsh_path | sudo tee -a /etc/shells >/dev/null
      chsh -s $zsh_path
    fi
    ;;
esac

unset zsh_path
unset shells_file
