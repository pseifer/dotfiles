# `> dotf`

This repository contains

- configuration files, mainly for my `alacritty`, `tmux`, `zsh` and `vim` stack, and
- a tool (`dotf`) for
  - linking, updating, and configuring dotfiles, as well as
  - installing programs through arbitrary setup scripts.

# Setup

Setting up `dotf` is as simple as cloning this repository to some location (e.g., `~/dotfiles`) and running `./setup`:

```sh
git clone https://github.com/pseifer/dotfiles.git ~/dotfiles; cd ~/dotfiles; ./setup
```

# Usage

Use `dotf install` for running `.install` scripts interactively and `dotf update` for a system and dotfiles update, including generating links in $HOME -- in order to just generate links with running a system update, use `dotf link`. For more information on available commands, refer to `dotf help`.
