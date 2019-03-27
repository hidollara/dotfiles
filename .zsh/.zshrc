source ${ZPLUG_HOME}/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux, if:"[ -x \"$(which tmux)\" ]"
zplug "paulirish/git-open"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'
zplug "hidollara/tmux-template", as:command, use:'(*).sh', rename-to:'$1', if:"[ -x \"$(which tmux)\" ]"

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

chpwd() { ls }

