# `> dotf`

This repository contains:

1) Configuration files, mainly for my `alacritty`, `tmux`, `zsh` and `vim` stack.
2) A tool (`dotf`) for:
2.1) linking, updating, and configuring dotfiles, as well as
2.2) installing programs through arbitrary setup scripts.

# Setup

Setting up `dotf` is as simple as cloning this repository to some location (e.g., `~/dotfiles`) and running `./setup`:

```sh
git clone https://github.com/pseifer/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup
```

# Usage

After running the setup script, the `dotf` program should be available (if `~/bin` is in `$PATH`); otherwise, you may also call `./dotf` directly in the cloned repository.
Basic commands are `dotf install` for running `.install` scripts interactively and `dotf update` for a system and dotfiles update. For more information on available commands, refer to `dotf help`. 
