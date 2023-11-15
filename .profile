# Setup environment variables - everywhere.

# This file is sourced in .zshenv
#   Note: Must be zsh compatible
# This file is read by bash
# This file is read by sh

# Add ~/bin and .local/bin to the path.

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add coursier to path.
export PATH="/home/pseifer/.local/share/coursier/bin:$PATH"

# Add texlive to path.
export PATH="/home/pseifer/.local/share/texlive/bin/x86_64-linux:$PATH"

# Set a python REPL startup file.
export PYTHONSTARTUP="$HOME/.pythonrc"

# Add Haskell (GHCup) environment.
[ -f "/home/pseifer/.ghcup/env" ] && source "/home/pseifer/.ghcup/env" # ghcup-env

# Source aliases and functions.
source "$HOME/.aliases"
source "$HOME/.functions"

osuname="$(uname -s)"
# Load system-specific files.
if [[ "${osuname}" == "Darwin" ]]; then
    source "$HOME/.onmacrc"
else
    source "$HOME/.onlinuxrc"
fi
