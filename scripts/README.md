# Scripts

A collection of simple utility tools that do not deserve their own git
repository. The folder `$HOME/scripts` is in
`$PATH`.

## `pscript`

The library `pscript` (PS script) is a common scripting
utility library available for all scripts in this folder.

# Tools

## `do-web-search`

Given a search query (optionally prefixed with `:` for bang
patterns), open a new tab in the standard browser and the search engine
query string in `SEARCH_PROVIDER` (or
<https://duckduckgo.com/?q> as a default). Aliased as
`alias s`\' do-web-search\'= in `../.aliases` to
avoid cluttering the shell history (note the leading space). Usage:
`s hello world` to use the configured search engine to search
for `hello world`, `s :g hello world` to provide
the bang pattern `!g` to the search engine, followed by the
search string `hello world`.

## `fuzzyphile`

CLI interface to navigate the filesystem with `fd` and `fzf`.
Full documentation with `fuzzyphile --help`. 

## `fzf-template`

Show all files in `$HOME/templates` and print the selected to
stdout. Usage `templatefzf > something.clj`.

## `fzf-todo`

An interactive wrapper around the `todo(man)` TODO manager,
using FZF. Aliased to `ti`.

## `merge-sync-conflict`

Merge syncthing conflicts in Markdon files. TODO: Include
`org-mode` as well.

## `run-backup`

Run Borg backup and `rclone` to Nextcloud; only on desktop.

## `smartless`

Combines various tools for pretty printing and then viewing files.
