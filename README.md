# `> dotfiles`

This repository contains configuration files, primarily for `alacritty`, `zsh` (featuring also: `tmux`) and `neovim` config.
An [Ansible](https://www.ansible.com/) playbook for installing various programs, located at [`.pkgs`](.pkgs), is included as well.

## Dependencies

The [`setup`](setup) script requires (and checks for) the following two dependencies:

- pipx
- git

On most distributions, `git` is already installed and `pipx` can be installed via the system package manager.

## Setup

```sh
curl -Ls https://raw.githubusercontent.com/pseifer/dotfiles/master/setup | bash
```

This will configure the dotfiles (bare) repository.
In order to install packages, review `.pkgs/local.yml` and run `./setup` again.

## Usage

[`.aliases`](.aliases) defines two relevant aliases for working with the dotfiles. `dot` allows for interacting with the bare dotfiles repository cloned via the [`setup`](setup) script; its works essentially as an alias for `git`. `update` is an alias for running the [`setup`](setup) script, which also works on already set-up systems. Essentially, it re-run the Ansible playbook.
