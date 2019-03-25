source ${ZPLUG_HOME}/init.zsh

export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -AGF"
alias l="ls"
alias mkdir="mkdir -p"
alias g++="g++ -std=c++11"
alias rm="rm -r"

autoload -U compinit
compinit

setopt histignorealldups

chpwd() { ls }

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

if ! zplug check; then
  zplug install
fi
zplug load

