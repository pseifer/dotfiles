#!/bin/bash

# Install ZSH and requirements / related tools.
common=(
    "zsh"
    "fzf"
    "bat"
    "zoxide"
    "fim"
    "imagemagick"
)

if punkt_pack_is "apt"; then
    punkt_pack_install "${common[@]}" "fd-find"
    # Install glow:
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" |
        sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt install glow
else
    punkt_pack_install "${common[@]}" "fd" "glow"
fi

# Install fast-syntax-highlighting for ZSH.
punkt_rm "fast-syntax-highlighting"
punkt_git "https://github.com/zdharma-continuum/fast-syntax-highlighting.git"

# Install additional zsh-completions for ZSH.
punkt_rm "zsh-completions"
punkt_git "https://github.com/zsh-users/zsh-completions.git"

# Install s1ck3r prompt.
punkt_git "https://github.com/pseifer/s1ck3r"
