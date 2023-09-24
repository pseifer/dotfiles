#!/bin/bash

# Install ZSH and requirements / related tools.
common=(
    "zsh"
    "fzf"
    "bat"
    "zoxide"
)

if punckt_pack_is "apt"; then
    punckt_pack_install "${common[@]}" "fd-find"
    # Install glow:
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" \
        | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt install glow
else
    punckt_pack_install "${common[@]}" "fd" "glow"
fi

# Install shellcheck linter.
punckt_pack_install shellcheck

# Install bashate
require "pip"
pip install bashate

# Install zoxide.
punckt_curl_bash "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh"

# Install fast-syntax-highlighting for ZSH.
punckt_rm "fast-syntax-highlighting"
punckt_git "https://github.com/zdharma-continuum/fast-syntax-highlighting.git"

# Install additional zsh-completions for ZSH.
punckt_rm "zsh-completions"
punckt_git "https://github.com/zsh-users/zsh-completions.git"

# Install s1ck3r prompt.
punkt_git "https://github.com/pseifer/s1ck3r"

