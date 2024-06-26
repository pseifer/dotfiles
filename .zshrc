#!/bin/zsh

# ZSH interactive shell setup.

# Optimized for short startup time.
# Uses fzf via Ctrl-E/Ctrl-R/Ctrl-T/CTRL-Y for fuzzy completion and 
# history search, which is much faster than ZSH completion
# plugins. Sets a simple, transient prompt (s1ck3r).

# Also see the following files:
#
# .zshenv   | sources .profile
# .zprofile | not used
# .zshrc    | interactive shell setup
# .zlogin   | not used
# .zlogout  | not used

# Dependencies:
#   fd/fdfind
#   fzf
#   bat/batcat

# On WSL, go to linux home.
[ -f /proc/version ] && grep -q icrosoft /proc/version && cd "$HOME" && export DISPLAY=localhost:0.0

# ----- Setup custom constants -----

export SEARCH_PROVIDER="https://kagi.com/search?q=" # Search to use for 's' command.

# ----- Setup interactive functions and aliases -----

# Setup functions and aliases.
source "$HOME/.aliases"
source "$HOME/.functions"

# Load system-specific setup files.
osuname="$(uname -s)"
if [[ "${osuname}" == "Darwin" ]]; then
    source "$HOME/.onmacrc"
else
    source "$HOME/.onlinuxrc"
fi

# ----- Theme: s1ck3r -----

# Add virtual environment as suffix.
export VIRTUAL_ENV_DISABLE_PROMPT=1  # disable default prompt update
s1ck3r_prompt_suffix ()
{
    if [[ -n "$VIRTUAL_ENV" ]] ; then
        echo -n " %F{$s1ck3r_color_dim}(%f"
        echo -n "%F{$s1ck3r_color_alternative}$(basename "$VIRTUAL_ENV")%f"
        echo -n "%F{$s1ck3r_color_dim})%f"
    fi
}

# Load the s1ck3r theme.
source "$HOME/.local/share/punkt/s1ck3r/s1ck3r.zsh"

# Set alias for resetting prompt on clear.
alias clear="unset S1CK3R_SPACIOUS_PROMPT && clear"

# ----- Setup ZSH defaults and plugins. -----

# Setup history.
#export HISTFILE="$HOME/.zsh_history"

# Set history file to host version.
HISTFILE=${ZDOTDIR:-~}/.zsh_histories/zsh_history_${(%):-%m}

# Ignore commands that start with whitespace.
setopt HISTIGNORESPACE

export HISTSIZE=1000000 # size of the loaded history (memory)
export SAVEHIST=1000000 # size of the history file
#setopt SHARE_HISTORY # sync between sessions
setopt HIST_IGNORE_ALL_DUPS # do not save dublicates

# Load history from all other host-based histories as well.
() {
  emulate -L zsh -o extended_glob
  local hist
  for hist in ~/.zsh_histories/zsh_history_*~$HISTFILE(N); do
    fc -RI -- "${hist}"
  done
}

setopt AUTO_CD # cd if not a command

setopt AUTO_PUSHD # push visited directories
setopt PUSHD_IGNORE_DUPS # ignore dublicates on stack
setopt PUSHD_SILENT # do not print directories

# Disable history expansion with '!'.
set -K

# Use VIM as default editor...
if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PAGER='less'

# And setup VI-style bindings.
bindkey -v
bindkey "^?" backward-delete-char    # backspace works
bindkey "^P" history-search-backward # Go up or
bindkey "^N" history-search-forward  # down history (same as in FZF)

# Do not care about case when completing.
CASE_SENSITIVE="true"

# Immediately complete to cycle.
#setopt MENU_COMPLETE

# Load additional completions.
fpath=("$HOME/.local/share/punkt/zsh-completions" $fpath)

# Initialize compinit.
autoload -Uz compinit 
case $(uname -s) in
  Darwin)
    if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
      compinit;
    else
      compinit -C;
    fi
    ;;
  Linux)
    if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
        compinit
      else
        compinit -C
    fi
    ;;
esac

# Load fast-syntax-highlighting (skip on WSL).
[ -f /proc/version ] && grep -q icrosoft /proc/version || source "$HOME/.local/share/punkt/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
# Manually run: fast-theme XDG:overlay (once) to enable custom theme.

# Initialize zoxide (z).
eval "$(zoxide init zsh)"

# Auto-aliases for strangely named packages.

if command -v fdind > /dev/null; then
    alias fd='fdfind'
fi

if command -v batcat > /dev/null; then
    alias bat='batcat'
fi

# Clear the screen with CTRL-O, instead of CTRL-L.
bindkey "^O" clear-screen

# ----- Setup FZF History support. -----

# Ctrl-R: Fuzzy search history (takes partial line into account).
if [ -f "/usr/share/doc/fzf/examples/key-bindings.zsh" ]; then 
    source "/usr/share/doc/fzf/examples/key-bindings.zsh"
elif [ -f "$HOME/.local/share/punkt/fzf-key-bindings.zsh" ]; then
    source "$HOME/.local/share/punkt/fzf-key-bindings.zsh"
fi
# source /usr/share/doc/fzf/examples/completion.zsh # uncomment to enable ** completion

# Uncomment: Inside a tmux session, open overlay for all FZF searches.
# Opening tmnux panes introduces a small delay.
#export FZF_TMUX_OPTS='-p80%,60%'

# Set the FZF color theme (light).
export FZF_DEFAULT_OPTS="
  --preview-window noborder
  --color=dark
  --color=prompt:green
  --color=pointer:black"

# ----- Setup Fuzzyfile, the fuzzy file navigator -----

# Source the 'fuzzyfile' function.
source "$HOME/.fuzzyfile"

# Basic fuzzyfile alias.
alias f=' fuzzyfile' # Space on purpose to hide from history.

# Use cd, vi, or open on files, disregarding ignore and showing hidden.
alias ff='f -si'
alias fv='f -sifv'
alias fo='f -sifo'

# Global navigation and file opening with ZSH keybinds.

# Define a ZSH function for using fuzzyfile with some arguments, and reset the prompt.
_fuzzyfile_with() { local cmd=$1; eval "fuzzyfile $cmd"; zle reset-prompt }                                             

# Use Ctrl-T to cd to any directory.
_fuzzyfile_home() { _fuzzyfile_with "-u" }
zle -N _fuzzyfile_home
bindkey ^T _fuzzyfile_home

# Use Ctrl-Y to cd to the dir of any file.
_fuzzyfile_homefile() { _fuzzyfile_with "-fu" }
zle -N _fuzzyfile_homefile
bindkey ^Y _fuzzyfile_homefile

# Use Ctrl-E to edit and file in vim.
_fuzzyfile_homevi() { _fuzzyfile_with "-fuv" }
zle -N _fuzzyfile_homevi
bindkey ^E _fuzzyfile_homevi



# ----- SDKman -----

# Note: Keep this at the end of the file.
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Return success in any case; zsh reports any errors.
return 0
