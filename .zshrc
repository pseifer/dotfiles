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

# ----- Setup ZSH History. -----

# Set history file to host-specific version 'zsh_history_{host}'.
HISTFILE=${ZDOTDIR:-~}/.zsh_histories/zsh_history_${(%):-%m}

# Ignore commands that start with whitespace.
# This is used for some commands, such as 'f ' for fuzzyphile.
setopt HISTIGNORESPACE

export HISTSIZE=1000000 # size of the loaded history (memory)
export SAVEHIST=1000000 # size of the history file
#setopt SHARE_HISTORY # sync between sessions (disabled)
setopt HIST_IGNORE_ALL_DUPS # do not save dublicates

# Load history from all other host-based histories and the archive as well.
() {
  emulate -L zsh -o extended_glob
  local hist
  for hist in ~/.zsh_histories/zsh_history_*~$HISTFILE(N); do
    fc -RI -- "${hist}"
  done
}

# Occasionally, run 'builtin fc -W zsh_history_archive' to store
# the loaded history in the archive, and delete host-specific
# versions; keeps the size smaller for syncing of changing
# files.

# ----- Setup ZSH defaults and plugins. -----

setopt AUTO_CD # cd if not a command

setopt AUTO_PUSHD # push visited directories
setopt PUSHD_IGNORE_DUPS # ignore dublicates on stack
setopt PUSHD_SILENT # do not print directories

# Disable history expansion with '!'.
set -K

# Use emacsclient as default editor, unless on ssh connection.
export EDITOR='nvim'

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

# ----- Setup FZF History support. -----

# Ctrl-R: Fuzzy search history (takes partial line into account).
if [ -f "/usr/share/doc/fzf/examples/key-bindings.zsh" ]; then
    source "/usr/share/doc/fzf/examples/key-bindings.zsh"
elif [ -f "$HOME/.local/share/punkt/fzf-key-bindings.zsh" ]; then
    source "$HOME/.local/share/punkt/fzf-key-bindings.zsh"
fi
# source /usr/share/doc/fzf/examples/completion.zsh # uncomment to enable ** completion

# Set the FZF color theme (light).
export FZF_DEFAULT_OPTS="
  --preview-window noborder
  --color=16
  --color=hl:yellow,fg+:white,hl+:bright-yellow"

# ----- Fuzzyfile - a simple and fuzzy file navigator. -----

eval $(fuzzyphile init zsh --default-keys --default-aliases)

# ----- Set custom (interactive) variables -----

export GLAMOUR_STYLE="$HOME/zenbones.json"
export MANPAGER='nvim +Man!'

# ---- Motto of the day -----
#echo "\033[0;036mOMNIBUS·EX·NIHILO·DUCENDIS·SUFFICIT·UNUM.\n\033[0m"

# Return success in any case; zsh reports any errors.
return 0

