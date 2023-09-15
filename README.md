# dotf

This repository contains:

1) Configuration files ('dotfiles') for various tools.
2) Simple tools to manage those dotfiles.
3) Post-install setup scripts install core tools.

# Setup

Either clone this repository 

```sh
git clone https://github.com/pseifer/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x dotf
./dotf install
``` 

or download the `dotf` script directly via 

```sh
curl -fLOs https://raw.githubusercontent.com/pseifer/dotfiles/master/dotf
# or wget https://raw.githubusercontent.com/pseifer/dotfiles/master/dotf
chmod +x dotf
./dotf install
```

# Usage

After setup, the `dotf` program should be available. For information on usage, run `dotf help`.

