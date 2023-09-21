#!/bin/bash

# If on macOS, install homebrew.
if punckt_os_is 'darwin'; then
    echo "TODO: Install Homebrew"
fi

# Install very basic packages.
punckt_pack_install zip tar git curl fontconfig

# Install other essential tools.
punckt_pack_install tmux xclip w3m ripgrep plocate tree rlwrap make htop

# Install GUI tools
if punckt_os_is 'darwin'; then
    brew install --cask firefox 
else
    punckt_pack_install firefox vlc arandr zathura thunar x11-xserver-utils
fi

# Install Java (OpenJFK 17)
if punckt_os_is 'darwin'; then
    punckt_pack_install 'openjdk@17'
else
    punckt_pack_install openjdk-17-jre openjdk-17-jdk openjdk-17-source
fi

