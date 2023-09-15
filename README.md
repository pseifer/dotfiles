# `> dotf`

This repository contains:

1) Configuration files, mainly for my `alacritty`, `fish`, `tmux` and `vim` stack.
2) A tool (`dotf`) for linking, updating, and configuring dotfiles.
3) Some post-install setup scripts for installing basic tools (and requirements) on new systems.

# Setup

Either clone (or download) this repository

```sh
git clone https://github.com/pseifer/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x dotf
./dotf install
``` 

or download the `dotf` script directly, which will bootstrap the system, via

```sh
curl -fLOs https://raw.githubusercontent.com/pseifer/dotfiles/master/dotf
# or wget https://raw.githubusercontent.com/pseifer/dotfiles/master/dotf
chmod +x dotf
./dotf install
```

# Usage

After setup, the `dotf` program should be available. Basic commands are `dotf install` for setup and `dotf update` to update. For more information on usage, run `dotf help`. 
