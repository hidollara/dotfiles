if [[ -z "$LANG" ]]; then export LANG='en_US.UTF-8'; fi

if [[ "$OSTYPE" == darwin* ]]; then export BROWSER='open'; fi
export EDITOR='vi'
export VISUAL='vi'
export PAGER='less'

export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

typeset -gU cdpath fpath mailpath path
path=(
  /usr/local/{bin,sbin}
  $path
)

export GOPATH=$HOME/go/package:$HOME/go/workspace
export PATH=$HOME/go/package/bin:$HOME/go/workspace/bin:$PATH

export TERM="xterm-256color"
export LSCOLORS=exfxcxdxbxegedabagacad

export GREP_COLOR="0;31"

