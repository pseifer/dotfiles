#!/bin/bash

if punkt_os_is "linux" ; then
    # Download NeoVim and link.
    punkt_curl_tar "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
    punkt_ln "nvim-linux64/bin/nvim" "nvim"
else
    # Install package.
    punkt_pack_install "nvim"
fi

