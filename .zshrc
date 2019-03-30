source ~/.zplug/init.zsh

zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/gist", as:command, hook-build:'go get -d && go build'
zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux, if:'[ -x $(which tmux) ]'
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "mafredri/zsh-async", use:async.zsh
zplug "mollifier/cd-gitroot"
zplug "sindresorhus/pure", use:pure.zsh, as:theme, on:'mafredri/zsh-async'
zplug "hidollara/tmux-template", as:command, use:'(*).sh', rename-to:'$1', if:'[ -x $(which tmux) ]'
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check; then zplug install; fi
zplug load

autoload -U compinit; compinit
setopt histignorealldups

alias ls="ls -AGF"
alias l="ls"
alias mkdir="mkdir -p"
alias rm="rm -r"
alias g++="g++ -std=c++11"
alias gitcd="cd-gitroot"

ENHANCD_HOOK_AFTER_CD="l"

fd() {
  local dir=$(find ${1:-.} -path "*/\.git*" -prune -o -type d 2> /dev/null| fzf) && cd "$dir"
}

fsd() {
  if [ -z $1 ]; then echo "Usage: fsd search-string [dir]"; return; fi
  local dir=$(grep $1 -rl ${2:-.}| fzf --preview "cat {}| grep --color=always -E \"$1|$\"" ) && cd "$dir"
}

