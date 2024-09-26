#!/bin/bash

s="duunitori"
cd "$HOME/code/dt" || exit

bash "$HOME/dotfiles/session-0.sh"

# Dotfiles
w=0

# Next
w=1
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdn" C-m
tmux send-keys -t $s:$w "pnpm dev" C-m

# Backend
w=2
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdb" C-m
tmux send-keys -t $s:$w "dcu" C-m
tmux kill-pane -t $s:$w.1

# Duunitori5
w=3
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdt" C-m
tmux send-keys -t $s:$w "make run" C-m
tmux split-window -hvt $s:$w
tmux send-keys -t $s:$w "cdt" C-m
tmux send-keys -t $s:$w "docker compose run node dev" C-m

# Jobbland
w=4
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdj" C-m
tmux send-keys -t $s:$w "npm run build-dev" C-m
tmux split-window -hvt $s:$w
tmux send-keys -t $s:$w "cdj" C-m
tmux send-keys -t $s:$w "npm run run-dev" C-m

# duunitori-kubernetes
w=5
