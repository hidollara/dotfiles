DOTPATH="${HOME}/.dotfiles"
if [ ! -e "$DOTPATH" ]; then git clone git://hidollara/dotfiles.git "$DOTPATH"; fi
cd "$DOTPATH"
make init
make deploy
