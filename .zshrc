if command -v tmux >/dev/null && [[ -z "$TMUX" ]]; then
    tmux attach || tmux new-session; exit
fi

export ZPLUG_HOME="$XDG_CACHE_HOME/zplug"
if [[ ! -d "$ZPLUG_HOME" ]]; then
  git clone https://github.com/zplug/zplug "$ZPLUG_HOME"
fi
source "$ZPLUG_HOME/init.zsh"

zplug 'b4b4r07/enhancd', use:init.sh
zplug 'b4b4r07/gist', as:command, hook-build:'go get -d && go build', use:gist
zplug 'b4b4r07/httpstat', as:command, use:'(*).sh', rename-to:'$1'
zplug 'junegunn/fzf', as:command, use:bin/fzf-tmux, if:'command -v tmux >/dev/null'
zplug 'junegunn/fzf-bin', as:command, from:gh-r, rename-to:fzf
zplug 'mafredri/zsh-async', use:async.zsh
zplug 'mollifier/cd-gitroot'
zplug "paulirish/git-open", as:command, use:git-open
zplug 'sindresorhus/pure', use:pure.zsh, as:theme, on:mafredri/zsh-async
zplug 'hidollara/tmux-template', as:command, use:'(*).sh', rename-to:'$1', if:'command -v tmux >/dev/null'
zplug 'hidollara/d23780028ad45da691be9b77b4f4f4b3', from:gist, use:tomorrow-night-eighties.sh
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

if ! zplug check; then zplug install; fi
zplug load

autoload -U compinit; compinit
setopt histignorealldups

export ENHANCD_DISABLE_HOME=1
export ENHANCD_DISABLE_DOT=1
export ENHANCD_HOOK_AFTER_CD=ls

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias ls='ls -AGF'
alias l='ls'
alias mkdir='mkdir -p'
alias rm='rm -r'
alias gitcd='cd-gitroot'

fd() {
  local dir
  dir=$(find "${1:-.}" -path "*/\.git*" -prune -o -type d 2> /dev/null| fzf) && cd "$dir" || exit
}

fsd() {
  if [ -z "$1" ]; then echo 'Usage: fsd search-string [dir]'; return; fi
  local dir
  dir=$(grep "$1" -rl "${2:-.}"| fzf --preview "cat {}| grep --color=always -E \"$1|$\"" ) && cd "$dir" || exit
}
