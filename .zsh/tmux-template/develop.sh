ROOT="#{pane_current_path}"

send_command() {
  tmux send-keys ${2:+"-t $2"} "$1" C-m
}

window_develop_with_exec_and_log() {
  tmux new-window -c $ROOT -n develop; send_command "exec vim ."
  tmux split-window -h -p 30 -c $ROOT; send_command "tail -f $2"
  tmux split-window -fv -p 30 -c $ROOT; send_command "exec $1"
  tmux split-window -h -p 80 -c $ROOT
  tmux split-window -h -p 50 -c $ROOT
}

window_develop_with_exec() {
  tmux new-window -c $ROOT -n develop; send_command "exec vim ."
  tmux split-window -v -p 30 -c $ROOT; send_command "exec $1"
  tmux split-window -h -p 80 -c $ROOT
  tmux split-window -h -p 50 -c $ROOT
}

window_develop() {
  tmux new-window -c $ROOT -n develop; send_command "exec vim ."
  tmux split-window -v -p 30 -c $ROOT
  tmux split-window -h -p 50 -c $ROOT
}

if [ $2 ]; then
  window_develop_with_exec_and_log $1 $2
elif [ $1 ]; then
  window_develop_with_exec $1
else
  window_develop
fi
tmux last-pane
tmux select-pane -t 0

