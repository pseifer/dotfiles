#!/bin/bash

# Install shellcheck linter.
punkt_pack_install shellcheck

# Install bashate
require "pip"
pip install bashate

# Install zoxide.
punkt_curl_bash "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh"

# On WSL, add links to Org and Projects on Windows Host.
grep -q Microsoft /proc/version && ln -s /mnt/d/Cloud/Org Org && ln -s /mnt/d/Projects Projects
