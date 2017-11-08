#!/bin/sh
SESSION="session-name"

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -k -n main
tmux send-keys -t $SESSION:1 'vim 0header.tex' C-m
tmux send-keys -t $SESSION:1 ':' 'tabe 1Intro.tex' C-m
tmux send-keys -t $SESSION:1 ':' 'tabe 2FirstPart.tex' C-m
tmux send-keys -t $SESSION:1 ':' 'tabe 3SecondPart.tex' C-m

tmux split-window -h -p 20
#tmux send-keys -t $SESSION:1 "make" C-m
tmux send-keys -t $SESSION:1 "xdg-open final.pdf &" C-m
tmux select-pane -t 0

tmux new-window -t $SESSION:2 -n makefile
tmux select-window -t $SESSION:2
tmux send-keys -t $SESSION:2 'vim tmux-start.bash' C-m
tmux send-keys -t $SESSION:2 ':' 'tabe makefile' C-m

tmux split-window -h
tmux select-pane -t 0

tmux new-window -t $SESSION:3 -n R
tmux select-window -t $SESSION:3
tmux send-keys -t $SESSION:3 'cd ./figures/' C-m
tmux send-keys -t $SESSION:3 'vim fig1.r' C-m
tmux send-keys -t $SESSION:3 ':' 'tabe fig2.r' C-m
tmux send-keys -t $SESSION:3 ':' 'tabe fig3.r' C-m
tmux send-keys -t $SESSION:3 ':' 'tabe fig4.r' C-m
tmux send-keys -t $SESSION:3 ':' 'tabe fig5.r' C-m

tmux select-window -t $SESSION:1

tmux attach -t $SESSION
