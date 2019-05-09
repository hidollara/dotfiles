#!/bin/bash

# brew
if ! command -v brew >/dev/null; then
  case "$OSTYPE" in
    darwin* )
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ;;
    linux* )
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
      export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
      ;;
  esac
fi

# brew install
brew bundle --global
[[ "$OSTYPE" == darwin* ]] && brew bundle --file="$DOTPATH/etc/brew/darwin/core" >/dev/null
[[ "$OSTYPE" == darwin* ]] && brew bundle --file="$DOTPATH/etc/brew/darwin/opt" >/dev/null &

# chsh
zsh_path="$(which zsh)"
shells_file='/etc/shells'
case "$OSTYPE" in
  darwin* )
    if [[ $(dscl . -read "/Users/$USER" UserShell | cut -d' ' -f2) != "$zsh_path" ]]; then
      sudo dscl . -create "/Users/$USER" UserShell "$zsh_path"
    fi
    ;;
  linux-* )
    if [[ $(grep "$USER" /etc/passwd | cut -d: -f7) != "$zsh_path" ]]; then
      cat "$shells_file" | grep "$zsh_path" >/dev/null || echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
      chsh -s "$zsh_path"
    fi
    ;;
esac
