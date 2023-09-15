function ttk
    if count $argv > /dev/null
        tmux kill-session -t $argv
    else
        tmux kill-session
    end
end
