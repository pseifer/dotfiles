#!/bin/bash

if punkt_pack_is "apt"; then
    # Add PPA and install.
    sudo add-apt-repository ppa:aslatter/ppa -y 
    sudo apt install alacritty
else
    # Hope for the best on other distros.
    punkt_pack_install "alacritty"
fi

if punkt_has "update-alternatives"; then
    # Set default terminal to alacritty.
    sudo update-alternatives --config x-terminal-emulator
fi

