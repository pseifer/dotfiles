#!/usr/bin/env bash

# Add some prefix key to labels et. al in a LaTeX document.

folder=${1?' Paper subfolder required as 1st argument.'}
key=${2?' Script requires a key to insert as its 2nd argument.'}

find "${folder}" -name "*.tex" -exec \
    sed -i "bak" "s/\Cref{/\Cref{${key}:/g" {} \;

find "${folder}" -name "*.tex" -exec \
    sed -i "bak" "s/\ref{/\ref{${key}:/g" {} \;

find "${folder}" -name "*.tex" -exec \
    sed -i "bak" "s/\label{/\label{${key}:/g" {} \;

find "${folder}" -name "*.tex" -exec \
    sed -i "bak" "s/\subref{/\subref{${key}:/g" {} \;

# Remove the backups.

# find "${folder}" -name "*.texbak" -exec \
#     rm {} \;
