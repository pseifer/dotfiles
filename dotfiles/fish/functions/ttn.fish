function ttn
    if count $argv > /dev/null
        tmux new -s $argv
    else
        tmux new
    end
end
