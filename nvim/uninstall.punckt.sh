#!/bin/bash

# Clean directory.
if punckt_os_is "linux"; then
    punckt_rm "nvim-linux64"
    punckt_unln "nvim"
fi

