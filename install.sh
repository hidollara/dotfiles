DOTPATH="${HOME}/.dotfiles"
if [ ! -e "$DOTPATH" ]; then git clone https://github.com/hidollara/dotfiles.git "$DOTPATH"; fi
cd "$DOTPATH"
make init
make deploy
