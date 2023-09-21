#!/bin/bash

if punckt_os_is "linux" ; then
    # Download NeoVim and link.
    punckt_curl_tar "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
    punckt_ln "nvim-linux64/bin/nvim" "nvim"
else
    # Install package.
    punckt_pack_install "nvim"
fi

