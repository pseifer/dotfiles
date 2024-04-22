# `> dotfiles`

This repository contains configuration files, primarily for my `alacritty`, `tmux`, `zsh` and `vim` stack, as well as an [Ansible](https://www.ansible.com/) playbook for installing various programs, located at [`.pkgs`](.pkgs).

## Dependencies

The [`setup`](setup) script requires (and checks for) the following two dependencies:

- pipx
- git

On most distributions, `git` is already installed and `pipx` can be installed via the system package manager.

## Setup

```sh
curl -Ls https://raw.githubusercontent.com/pseifer/dotfiles/master/setup | bash
```

## Usage

[`.aliases`](.aliases) defines two relevant aliases for working with the dotfiles. `dot` allows for interacting with the bare dotfiles repository cloned via the [`setup`](setup) script; its works essentially as an alias for `git`. `update` is an alias for running the [`setup`](setup) script, which also works on already set-up systems. Essentially, it will (i) pull the repository and (ii) re-run the Ansible playbook. (Thus, running `update` may result in a merge conflict which should be resolved first.)
