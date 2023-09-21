#!/bin/bash

# Ensure .local/share exists (for /fonts).
mkdir -p ~/.local/share

punckt_curl_gzip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip" "sauce-code-pro"
punckt_ln "sauce-code-pro" "${HOME}/.local/share/fonts"

# Refresh font cache.
if punckt_has "fc-cache"; then
	fc-cache -f -v
fi

