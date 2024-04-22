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

if [ -d "$HOME/.cargo/bin" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# Add Haskell (GHCup) environment.

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# Add Coursier and Java to PATH.

osuname="$(uname -s)"
if [[ "${osuname}" == "Darwin" ]]; then
    export JAVA_HOME="$HOME/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.21%252B9/OpenJDK11U-jdk_aarch64_mac_hotspot_11.0.21_9.tar.gz/jdk-11.0.21+9/Contents/Home"
    export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
else
    export JAVA_HOME="$HOME/.cache/coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.21%252B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.21_9.tar.gz/jdk-11.0.21+9"
    export PATH="$PATH:$HOME/.cache/coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.21%252B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.21_9.tar.gz/jdk-11.0.21+9/bin"
    export PATH="$HOME/.local/share/coursier/bin:$PATH"
fi
