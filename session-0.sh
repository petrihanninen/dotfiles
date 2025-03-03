#!/bin/bash

s="duunitori"
cd "$HOME/code/dt" || exit

tmux new-session -d -s $s

# Dotfiles
w=1
tmux rename-window -t $s:$w "dotfiles"
tmux send-keys -t $s:$w "cd $HOME/dotfiles; v" C-m

# Next
w=2
tmux new-window -t $s:$w -n "next"
tmux send-keys -t $s:$w "cdn" C-m
tmux send-keys -t $s:$w "v" C-m

# Backend
w=3
tmux new-window -t $s:$w -n "no backend"
tmux send-keys -t $s:$w "cdb" C-m
tmux send-keys -t $s:$w "v" C-m

# Duunitori5
w=4
tmux new-window -t $s:$w -n "fi"
tmux send-keys -t $s:$w "cdt" C-m
tmux send-keys -t $s:$w "v" C-m

# Jobbland
w=5
tmux new-window -t $s:$w -n "se"
tmux send-keys -t $s:$w "cdj" C-m
tmux send-keys -t $s:$w "v" C-m

# duunitori-kubernetes
w=6
tmux new-window -t $s:$w -n "kube"
tmux send-keys -t $s:$w "cd duunitori-kubernetes" C-m
tmux send-keys -t $s:$w "v" C-m
