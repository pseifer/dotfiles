# DOTFILES
This repository contains:
1) My configuration files ('dotfiles') for various applications
2) Simple tools to manage those dotfiles
3) My post-install setup script for GNU/Linux systems (Arch-based)

## LINKING
The configuration files remain in the cloned dotfile repository,
while the tool generates symbolic links in the appropriate locations.
To use the default setup, simply run ```make```.

Alternatively, ```make install``` can be used to build local configuration
files ```config.config``` and ```dotfiles.config```, which can be customized
before running ```make```. The ```dotfiles.config``` file contains the
mapping between files in the ```dotfiles``` repository and the respective 
target dotfile locations. It can be customized to add/exclude dotfiles 
which are required or not required on the particular system.

If the target file already exists at the target location,
a backup is kept. Backups can be removed with ```make clear```.

## SETUP
The ```src/setup``` script contains package lists and setup steps for various applications.
Run ```src/setup help``` to see how both the interactive and list-based mode work.
As a default, ```make setup``` uses the ```default/setup.config``` file as input to the list-mode.
