# `> punkt`

This is punkt, a simplistic tool for managing cross-platform dotfiles, packages, and all kinds of custom setup scripts.

- Symlink dotfiles from a git repository.
- Install system packages in a cross-plattform friendly way.
- Define custom install scripts (using bash), that
  - manage instructions for manually installing or building programs,
  - remind you what to set up on fresh systems,
  - and install things of course!

## Contents

2. [Creating Packages](#creating-packages)
3. [Variables](#variables)
4. [Command Line Interface](#command-line-interface)
5. [Package Support API](#package-support-api)

## Creating Packages

A punkt package is a plain, non-hidden folder (not starting with `_`) in dotfiles, e.g.:

```
nvim/
- install.punkt.sh
- uninstall.punkt.sh
- dot-config/
--- nvim/
----- ...
```

A package may contain an (optional) bash script `install.punkt.sh` as well as an (optional) bash script `uninstall.punkt.sh`.
When running `punkt install nvim` (in this caes), first the uninstall script and then the install script are executed; thus, uninstall scripts can be used for updating manually packages (and should be robust in this sense).

See also [Command Line Interface](#command-line-interface) for more details on running punkt, and [Package Support API](#package-support-api) for more information on how to define packages easily.

All other files inside a package are considered configuration files which are linked to `$HOME` when using `punkt link <package>`.
There is one special case to consider: All files that are prefixed with `dot-` are automatically converted to files prefixed with `.`, so that your packages are not required to include a bunch of hidden files - this feature is optional.
Since punkt is using `stow` internally, this currently does *not* work for arbitrary directories.
However, punkt implements a special exception for the commonly used directory `.config`, such that you may also use `dot-config` inside your packages.
If you want to link any other *hidden* directory "dir", you must use `.dir`, not `dot-dir`.

Example ZSH package structure like this

```
zsh/
- install.punkt.sh
- dot-zshenv
- dot-zshrc
```

but could also be like this

```
zsh/
- .zshenv
- ...
```

## Command Line Interface

Punkt offers a simple interface for installing and linking packages. You may also consult `punkt help` for all available commands.

### `punkt install <pkg*>`

Install the package(s) spcified on the command line, i.e., run the respective `uninstall.punkt.sh` *and* `install.punkt.sh` scripts (in this order; if they exist).
If called without any arguments, installs *all* packages.

Examples:
- `punkt install nvim zsh` installs the `nvim` and `zsh` packages.
- `punkt install` installs all available packages.

If a punkt package exists, but does not contain an `install.punkt.sh` file, then punkt attempts to install this package via the system package manager.
This is usually useful. If you do not want this behavior for a particular punkt package, create an empty `install.punkt.sh` file (or don't call it with install, I guess).

There is also a command `punkt uninstall`, which works similarly but only calls `uninstall.punkt.sh` (if it exists).

### `punkt interactive`

Similar to running `punkt install` but asking interactively whether to install for all known packages.

### `punkt link <pkg*>`

Link the package(s) specified on the command line.
If called without any arguments, links *all* packages.

Examples:
- `punkt link nvim zsh` links the `nvim` and `zsh` packages.
- `punkt link` links all available packages.

If the location is already inhabited by a file (or some other link), punkt will give a warning and exit for you to deal with it.

### `punkt update`

This first executes a system update (via the system package manager), refreshes your dotfiles repository (using git pull) and then runs `punkt link`. 
Note, that install scripts are *not* executed by this command.
If you want to fully refresh the system (and your packages are set up to support this!) then you can run `punkt update && punkt install`.

## Variables

Punkt relies on three variables, which are set to sensible defaults, as follows:

| Variable          | Default            | Meaning                                             |
|-------------------|--------------------|-----------------------------------------------------|
| `PUNKT_DOTFILES` | `"$HOME/dotfiles"`     | Location of the dotfiles repository             |
| `PUNKT_STORAGE`  | `"$HOME/.local/share"` | See [Package Support API](#package-support-api) |
| `PUNKT_BIN`      | `"$HOME/bin"`          | See [Package Support API](#package-support-api) |

On startup, punkt sources the file `~/.punktrc` (if it exists), which can be used to change these defaults.
My setup script ([pseifer/dotfiles](https://github.com/pseifer/dotfiles)) generates a basic `~/.punktrc` file, automatically setting `$punkt_DOTFILES` to itself.

## Package Support API

Punkt implements a small set of utility functions for defining packages.
Using this API is not required for using punkt, but it does make it easier.
As an example, consider the following NeoVim package definition (`nvim/install.punkt.sh`):

```bash
#!/bin/bash

if punkt_os_is "linux" ; then
    # Download NeoVim and link.
    punkt_curl_tar \
        "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
    punkt_ln "nvim-linux64/bin/nvim" "nvim"
else
    # Install package.
    punkt_pack_install "nvim"
fi
```

This installer will automatically curl (and untar) NeoVim binaries to `$punkt_STORAGE/nvim-linux64` on any Linux ("linux") distribution (since packages are sometimes quite outdated, e.g., on Debian/Ubuntu), and create a link from `$punkt_BIN/nvim`.
On other systems, e.g., macOS (could be matched with punkt_os_is "darwin"), use the respective package manager (i.e., Homebrew).
Note, that you could also use, e.g., `punkt_distr_is "ubuntu"` (or `punkt_pack_is "apt"`) to only install binaries on more specific systems.

A companion uninstaller (`nvim/uninstall.punkt.sh`) could look as follows:

```bash
#!/bin/bash

# Clean nvim directory.
if punkt_os_is "linux"; then
	punkt_rm "nvim-linux64"
    punkt_unln "${punkt_BIN:?}/nvim"
fi
```

Punkt does not support uninstalling package-manager installed packages.
Uninstall files are supported by punkt to update (and remove) manual installations.
Packages installed via the package manager are already updated when using `punkt system-update` (or `punkt update`).
If you really want to manually uninstall a system package in an uninstall script, you can find out what package manager you have available via `punkt_distr_is "..."` or `punkt_pack_is "..."` and run the respective command.
Note, however, that uninstall files are executed whenever running install, which may not be desireable in the aforementioned use case.

Currently, no complete documentation is available for the support API; however, the source code in `src/punkt-api` is reasonably well documented, and quite trivial.

### Dependencies

Punkt is not made to handle dependencies (outside of the scope of your own install scripts).
For utility purposes, there is a function `punkt_has` which checks for a command being available (using `command -v`) and `punkt_require`, which will additionally ask the user whether to try and install the program using the system package manager. 
(This only works if the name of the binary is the same as for the package.)

Punkt packages should probably not introduce dependencies on each other, since that would be rather confusing and hard to maintain.
However, when using `punkt install`, packages *are* executed in ASCII order: Thus, it can be sensible to include a package which installs some basic tools that is alphabetically first.

