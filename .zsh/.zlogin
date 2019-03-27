if [[ -x "$(which tmux)" && -z $TMUX ]]; then
    tmux attach || tmux new-session; exit
fi

