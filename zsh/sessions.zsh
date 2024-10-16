function sdot() {
  s="dotfiles"
  path="$HOME/dotfiles"

  cd $path

  tmux has-session -t $s 2>/dev/null

  if [ $? == 0 ]; then
    tmux attach-session $s
  else
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
  fi
}

function sdn() {
  s="duunitori-next"
  path="$HOME/code/dt/duunitori-next"

  cd $path

  tmux has-session -t $s 2>/dev/null

  if [ $? == 0 ]; then
    tmux attach-session $s
  else
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
    tmux send-keys -t $s:$w "pnpm dev" C-m
  fi
}

function sdb() {
  s="duunitori-backend"
  path="$HOME/code/dt/duunitori-backend"

  cd $path

  tmux has-session -t $s 2>/dev/null

  if [ $? == 0 ]; then
    tmux attach-session $s
  else
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
    tmux send-keys -t $s:$w "docker compose up" C-m
  fi
}

function sdt() {
  s="duunitori5"
  path="$HOME/code/dt/duunitori5"

  cd $path

  tmux has-session -t $s 2>/dev/null

  if [ $? == 0 ]; then
    tmux attach-session $s
  else
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
}

function sjl() {
  s="jobbland-frontend"
  path="$HOME/code/dt/jobbland-frontend"

  cd $path

  tmux has-session -t $s 2>/dev/null

  if [ $? == 0 ]; then
    tmux attach-session $s
  else
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
    tmux send-keys -t $s:$w "npm run build-dev" C-m
    tmux split-window -hvt $s:$w
    tmux send-keys -t $s:$w "cd $path" C-m
    tmux send-keys -t $s:$w "npm run run-dev" C-m
  fi
}

function sdk() {
  s="duunitori-kubernetes"
  path="$HOME/code/dt/duunitori-kubernetes"

  cd $path

  tmux has-session -t $s 2>/dev/null

  if [ $? == 0 ]; then
    tmux attach-session $s
  else
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

    # k9s
    w=2
    tmux new-window -t $s:$w -n "k9s"
    tmux send-keys -t $s:$w "cd $path" C-m
    tmux send-keys -t $s:$w "k9s" C-m
  fi
}
