if [[ ! -f "$HOME/.zshrc.zwc" || $(readlink "$HOME/.zshrc" || echo "$HOME/.zshrc") -nt "$HOME/.zshrc.zwc" ]]; then
  zcompile "$HOME/.zshrc"
fi

if [[ ! -d "$ZPLGM[BIN_DIR]" ]]; then
  git clone https://github.com/zdharma/zplugin "$ZPLGM[BIN_DIR]"
fi
source "$ZPLGM[BIN_DIR]/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin light "zsh-users/zsh-autosuggestions"
zplugin light "zsh-users/zsh-completions"
zplugin light "zsh-users/zsh-syntax-highlighting"
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light "sindresorhus/pure"
zplugin ice from"gh-r" bpick"*linux64*" mv"jq-* -> jq" as"program"; zplugin light "stedolan/jq"
zplugin ice from"gh-r" as"program"; zplugin light "junegunn/fzf-bin"
zplugin ice pick"init.sh"; zplugin light "b4b4r07/enhancd"
zplugin ice as"program" mv"httpstat.sh -> httpstat" pick"httpstat"; zplugin light "b4b4r07/httpstat"
zplugin light "mollifier/cd-gitroot"
zplugin ice as"program" pick"git-open"; zplugin light "paulirish/git-open"

autoload -U compinit; compinit -d "$ZPLGM[ZCOMPDUMP_PATH]"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias vi='vim'
alias l='command ls -F --color=auto'
alias ls='command ls -AGF --color=auto'
alias mkdir='mkdir -p'
alias rm='rm -r'
alias gitcd='cd-gitroot'
eval $(hub alias -s)

fd() {
  local dir
  dir=$(find "${1:-.}" -path "*/\.git*" -prune -o -type d 2> /dev/null| fzf) && cd "$dir" || exit
}

fsd() {
  if [ -z "$1" ]; then echo 'Usage: fsd search-string [dir]'; return; fi
  local dir
  dir=$(grep "$1" -rl "${2:-.}"| fzf --preview "cat {}| grep --color=always -E \"$1|$\"" ) && cd "$dir" || exit
}

mkdcd() {
  mkdir $1 && cd $1
}

showoptions() {
  set -o | sed -e 's/^no\(.*\)on$/\1  off/' -e 's/^no\(.*\)off$/\1  on/'
}
