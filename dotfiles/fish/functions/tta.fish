function tta
    if count $argv > /dev/null
        tmux attach -t $argv
    else
        tmux attach
    end
end
