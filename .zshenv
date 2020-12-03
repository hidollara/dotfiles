if [[ -z "$LANG" ]]; then export LANG='ja_JP.UTF-8'; fi
if [[ "$OSTYPE" == darwin* ]]; then export BROWSER='open'; fi

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"

export EDITOR='vi'
export VISUAL='vi'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"

export GREP_COLOR='0;31'
export LSCOLORS='exfxcxdxbxegedabagacad'

declare -A ZPLGM
ZPLGM[BIN_DIR]="$XDG_DATA_HOME/zplugin/bin"
ZPLGM[HOME_DIR]="$XDG_DATA_HOME/zplugin"
ZPLGM[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/.zcompdump"
export ENHANCD_DIR="$XDG_CACHE_HOME"
export ENHANCD_DISABLE_HOME=1
export ENHANCD_DISABLE_DOT=1
export ENHANCD_HOOK_AFTER_CD=ls

setopt hist_ignore_all_dups
unsetopt flow_control
unsetopt global_rcs

if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

typeset -gU cdpath fpath mailpath path

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go/package:$XDG_DATA_HOME/go/workspace"
[ -x /usr/libexec/path_helper ] && eval `/usr/libexec/path_helper -s`
path=(
  $XDG_DATA_HOME/bin
  $CARGO_HOME/bin
  $XDG_DATA_HOME/go/{package,workspace}/bin
  /usr/local/{bin,sbin}
  $path
)
