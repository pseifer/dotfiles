# `> dotfiles`

This repository contains configuration files, primarily for my `alacritty`, `zsh` (featuring also: `tmux`) and `nvim` config, but it includes many other odds and ends as well. Works on both Linux and macOS systems. An [Ansible](https://www.ansible.com/) playbook for installing various programs, located at [`.pkgs`](.pkgs), is also included (... which does have the tendency to drift a bit out-of-date), and utility scripts in [`scripts`](scripts).

## Dependencies

The [`setup`](setup) script requires (and checks for) the following two dependencies:

- pipx (required for Ansible)
- git

On most distributions, `git` is already installed and `pipx` can be installed via the system package manager.

## Setup

```sh
curl -Ls https://raw.githubusercontent.com/pseifer/dotfiles/master/setup | bash
```

This will configure the dotfiles (bare) repository. In order to install packages, first review `.pkgs/local.yml` and then run `./setup` again.

## Usage

[`.aliases`](.aliases) defines a series of aliases for working with dotfiles. Essentially, `rgit` is an alias using either `git` pre-configured for the bare repository, if invoked in `$HOME`, or ordinary `git`, anywhere else. A series of abbreviation (e.g., `ggs` for `rgit status`) is built on `rgit`. The alias `update` runs the [`setup`](setup) script, which also works on already set-up systems to essentially re-run the Ansible playbook.
