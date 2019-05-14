if [[ -z "$LANG" ]]; then export LANG='en_US.UTF-8'; fi
if [[ "$OSTYPE" == darwin* ]]; then export BROWSER='open'; fi
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
export EDITOR='vi'
export VISUAL='vi'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"
export TERM='xterm-256color'
export LSCOLORS='exfxcxdxbxegedabagacad'
export GREP_COLOR='0;31'
export GOPATH="$HOME/go/package:$HOME/go/workspace"
export ZPLUG_HOME="$XDG_CACHE_HOME/zplug"
export ENHANCD_DIR="$XDG_CACHE_HOME"
export ENHANCD_DISABLE_HOME=1
export ENHANCD_DISABLE_DOT=1
export ENHANCD_HOOK_AFTER_CD=ls
source "$XDG_CONFIG_HOME/colorscheme/tomorrow-night-eighties"

setopt hist_ignore_all_dups
unsetopt flow_control
unsetopt global_rcs

typeset -gU cdpath fpath mailpath path

[ -x /usr/libexec/path_helper ] && eval `/usr/libexec/path_helper -s`
path=(
  /home/linuxbrew/.linuxbrew/{bin,sbin}(N-/)
  $HOME/bin
  $HOME/go/{package,workspace}/bin
  /usr/local/{bin,sbin}
  $path
)
