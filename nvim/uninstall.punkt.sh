#!/bin/bash

# Clean directory.
if punkt_os_is "linux"; then
    punkt_rm "nvim-linux64"
    punkt_unln "nvim"
fi

