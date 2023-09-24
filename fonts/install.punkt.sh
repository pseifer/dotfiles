#!/bin/bash

# Ensure .local/share exists (for /fonts).
mkdir -p ~/.local/share

punkt_curl_gzip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip" "sauce-code-pro"
punkt_ln "sauce-code-pro" "${HOME}/.local/share/fonts"

# Refresh font cache.
if punkt_has "fc-cache"; then
	fc-cache -f -v
fi

