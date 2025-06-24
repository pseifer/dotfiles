# Setup environment variables - everywhere.

# This file is sourced in .zshenv
#   Note: Must be zsh compatible
# This file is read by bash
# This file is read by sh

# Add ~/bin and .local/bin to the path.
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# Ad ~/scripts to path, which is used for user-scripts.
[ -d "$HOME/scripts" ] && PATH="$HOME/scripts:$PATH"

# Add Cargo binary location to path.
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

# Add Haskell (GHCup) environment.
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# Add Doom to path.
[ -d "$HOME/.emacs.d/bin" ] && PATH="$HOME/.emacs.d/bin:$PATH"

# Automatically set JAVA_HOME, using coursier on Mac.
osuname="$(uname -s)"
if [[ "${osuname}" == "Darwin" ]]; then
    command -v cs >/dev/null 2>&1 && eval "$(cs java --jvm 21 --env)"
else
    export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
fi

# Add go and GOPATH to the path.
[ -d "/usr/local/go/bin" ] && PATH="/usr/local/go/bin:$PATH"
[ -d "$HOME/go/bin" ] && PATH="$HOME/go/bin:$PATH"
