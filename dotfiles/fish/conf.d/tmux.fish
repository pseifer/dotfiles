if status is-interactive
and not set -q TMUX
    # set -g TMUX tmux new-session -d -s base
    # eval $TMUX
    # tmux attach-session -d -t base
    exec tmux
end
