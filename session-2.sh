#!/bin/bash

s="duunitori"
cd "$HOME/code/dt" || exit

tmux new-session -d -s $s

# Dotfiles
w=0
tmux rename-window -t $s:$w "dotfiles"
tmux send-keys -t $s:$w "cd $HOME/dotfiles; v" C-m

# Next
w=1
tmux new-window -t $s:$w -n "next"
tmux send-keys -t $s:$w "cdn" C-m
tmux send-keys -t $s:$w "v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdn" C-m
tmux send-keys -t $s:$w "pnpm dev" C-m
tmux split-window -vft $s:$w
tmux send-keys -t $s:$w "cdn" C-m

# Backend
w=2
tmux new-window -t $s:$w -n "backend"
tmux send-keys -t $s:$w "cdb" C-m
tmux send-keys -t $s:$w "v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdb" C-m
tmux send-keys -t $s:$w "dcu; dp" C-m

# Duunitori5
w=3
tmux new-window -t $s:$w -n "duunitori5"
tmux send-keys -t $s:$w "cdt" C-m
tmux send-keys -t $s:$w "v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdt" C-m
tmux send-keys -t $s:$w "dcu; dp" C-m

# Jobbland
w=4
tmux new-window -t $s:$w -n "jobbland"
tmux send-keys -t $s:$w "cdj" C-m
tmux send-keys -t $s:$w "v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdj" C-m
tmux send-keys -t $s:$w "npm run build-dev" C-m
tmux split-window -hvt $s:$w
tmux send-keys -t $s:$w "cdj" C-m
tmux send-keys -t $s:$w "npm run run-dev" C-m
