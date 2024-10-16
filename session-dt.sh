s="duunitori5"
path="$HOME/code/dt/duunitori5"

cd $path

tmux has-session -t $s 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $s

  # Shell
  w=0
  tmux rename-window -t $s:$w "shell"
  tmux send-keys -t $s:$w "cd $path" C-m

  # Editor
  w=1
  tmux new-window -t $s:$w -n "nvim"
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "v" C-m

  # Servers
  w=2
  tmux new-window -t $s:$w -n "server"
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "make run" C-m
  tmux split-window -hvt $s:$w
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "docker compose run node dev" C-m
fi

tmux attach-session -t $s
