DOTPATH="$HOME/.dotfiles"

if ! command -v brew >/dev/null; then
  case "$OSTYPE" in
    darwin* )
      /usr/bin/ruby -e "$(curl -fsSL https://raw/githubusercontent.com/Homebrew/install/master/install)"
      ;;
    linux* )
      if command -v apt >/dev/null; then
        sudo apt -y install build-essential curl file git
      elif command -v dnf >/dev/null; then
        sudo dnf -y groupinstall 'Development Tools' && sudo dnf -y install curl file git
      else
        exit 1
      fi
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
      export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
      ;;
    * )
      exit 1
      ;;
  esac
fi
test -e "$DOTPATH" || git clone https://github.com/hidollara/dotfiles.git "$DOTPATH"
cd "$DOTPATH"
make init
make deploy
