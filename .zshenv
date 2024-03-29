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

export BASE16_DEFAULT_THEME="tomorrow-night-eighties"
export GREP_COLOR='0;31'
export LSCOLORS='exfxcxdxbxegedabagacad'

setopt hist_ignore_all_dups
unsetopt flow_control
unsetopt global_rcs

if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

typeset -gU cdpath fpath mailpath path

declare -A ZINIT
ZINIT[BIN_DIR]="$XDG_DATA_HOME/zinit/zinit.git"
ZINIT[HOME_DIR]="$XDG_DATA_HOME/zinit"
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/.zcompdump"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export ENHANCD_DIR="$XDG_CACHE_HOME"
export ENHANCD_DISABLE_HOME=1
export ENHANCD_DISABLE_DOT=1
export ENHANCD_HOOK_AFTER_CD=ls

[ -x /usr/libexec/path_helper ] && eval `/usr/libexec/path_helper -s`
path=(
  $CARGO_HOME/bin
  /usr/local/{bin,sbin}
  $path
)
