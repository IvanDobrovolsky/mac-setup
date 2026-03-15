#!/bin/bash

# twd - Tmux Working Directory
# Opens a 4-pane dev layout in the current directory
#
# Layout:
# +------------------------+------------+
# |                        |            |
# |   nvim .               | claude code|
# |   (70w x 75h)          | (30w x 75h)|
# |                        |            |
# +------------------------+------------+
# |  lazygit               |  terminal  |
# |  (70w x 25h)           | (30w x 25h)|
# +------------------------+------------+

DIR="${1:-.}"
DIR="$(cd "$DIR" && pwd)"
SESSION_NAME="$(basename "$DIR")"

# If already inside tmux, detach first
if [ -n "$TMUX" ]; then
    echo "Already in tmux. Use: tmux switch-client -t $SESSION_NAME"
    exit 1
fi

# Kill existing session with same name
tmux has-session -t "$SESSION_NAME" 2>/dev/null && tmux kill-session -t "$SESSION_NAME"

# Create session (pane 1: left side)
tmux new-session -d -s "$SESSION_NAME" -c "$DIR" -x "$(tput cols)" -y "$(tput lines)"

# Split left/right first (pane 1: left, pane 2: right)
tmux split-window -h -t "$SESSION_NAME" -c "$DIR" -p 30

# Split left side top/bottom (pane 1: nvim, pane 2: lazygit)
tmux select-pane -t 1
tmux split-window -v -t "$SESSION_NAME" -c "$DIR" -p 25
tmux send-keys -t "$SESSION_NAME" "lazygit" Enter

# Split right side top/bottom (pane 3: claude, pane 4: terminal)
tmux select-pane -t 3
tmux split-window -v -t "$SESSION_NAME" -c "$DIR" -p 25

# Start apps in correct panes
tmux send-keys -t 1 "nvim ." Enter
tmux send-keys -t 3 "claude --dangerously-skip-permissions" Enter

# Focus on nvim pane
tmux select-pane -t 1

# Attach
tmux attach-session -t "$SESSION_NAME"
