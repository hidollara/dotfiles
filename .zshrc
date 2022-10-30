if [[ ! -f "$HOME/.zshrc.zwc" || $(readlink "$HOME/.zshrc" || echo "$HOME/.zshrc") -nt "$HOME/.zshrc.zwc" ]]; then
  zcompile "$HOME/.zshrc"
fi

if [[ ! -d "$ZINIT[BIN_DIR]" ]]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT[BIN_DIR]"
fi
source "$ZINIT[BIN_DIR]/zinit.zsh"

zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-completions"
zinit light "zsh-users/zsh-syntax-highlighting"
zinit compile"(async|pure).zsh" pick"async.zsh" src"pure.zsh" light-mode for "sindresorhus/pure"
zinit from"gh-r" as"program" mv"jq-* -> jq" light-mode for "stedolan/jq"
zinit from"gh-r" as"program" light-mode for "junegunn/fzf"
zinit light "b4b4r07/enhancd"
zinit as"program" cp"httpstat.sh -> httpstat" pick"httpstat" light-mode for "b4b4r07/httpstat"
zinit light "mollifier/cd-gitroot"
zinit light "paulirish/git-open"
zinit light "asdf-vm/asdf"
zinit light "$XDG_DATA_HOME/bin"

autoload -Uz compinit && compinit -d "$ZINIT[ZCOMPDUMP_PATH]"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias vi='vim'
case "$OSTYPE" in
  darwin*) alias l='command ls -GF' ;;
  *) alias l='command ls -F --color=auto' ;;
esac
alias ls='l -A'
alias mkdir='mkdir -p'
alias rm='rm -r'
alias gitcd='cd-gitroot'
alias dc='docker-compose'
