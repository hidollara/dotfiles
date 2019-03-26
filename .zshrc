source ${ZPLUG_HOME}/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "paulirish/git-open"
zplug "mollifier/cd-gitroot"

zplug load

autoload -U compinit; compinit
setopt histignorealldups

chpwd() { ls }

alias ls="ls -AGF"
alias l="ls"
alias mkdir="mkdir -p"
alias rm="rm -r"
alias g++="g++ -std=c++11"
alias gitcd="cd-gitroot"

