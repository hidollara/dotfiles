if [[ -z "$LANG" ]]; then export LANG='en_US.UTF-8'; fi
if [[ "$OSTYPE" == darwin* ]]; then export BROWSER='open'; fi
export EDITOR='vi'
export VISUAL='vi'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export TERM='xterm-256color'
export LSCOLORS='exfxcxdxbxegedabagacad'
export GREP_COLOR='0;31'
export GOPATH="$HOME/go/package:$HOME/go/workspace"
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"

typeset -gU cdpath fpath mailpath path
path=(
  $HOME/go/{package,workspace}/bin
  /usr/local/opt/llvm/bin
  /usr/local/{bin,sbin}
  $path
)
