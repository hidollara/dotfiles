DOTPATH="${HOME}/.dotfiles"
if [ ! -e ${DOTPATH} ]; then git clone git@github.com:hidollara/dotfiles.git ~/.dotfiles; fi
cd ~/.dotfiles
make prepare
make deploy

