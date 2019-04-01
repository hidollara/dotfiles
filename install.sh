DOTPATH="${HOME}/.dotfiles"
if [ ! -e "$DOTPATH" ]; then git clone git@github.com:hidollara/dotfiles.git "$DOTPATH"; fi
cd "$DOTPATH"
make init
make deploy
