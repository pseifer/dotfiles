# Scripts

A collection of simple utilities that do not deserve a git repository. The folder `$HOME/scripts` is in `$PATH`.

# `do-web-search`

Given a search query (optionally prefixed with `:` for bang patterns), open a new tab in the standard browser and the search engine query string in `SEARCH_PROVIDER` (or `https://duckduckgo.com/?q=` as a default). Aliased as `alias s=' do-web-search'` to avoid cluttering the shell history (note the space). Usage: `s hello world` to use the configured search engine, `s :g hello world` to use Google (iff the search engine supports bang patterns).

# `run-backup`

Run Borg backup and `rclone` to Nextcloud. Only on desktop.

# `smartless`

Combines various tools for pretty printing and then viewing files.

# `todofzf`

An interactive wrapper around the `todo(man)` TODO manager, using FZF. Aliased to `ti`.

# `templatefzf`

Show all files in `$HOME/templates` and print the selected to stdout. Usage `templatefzf > something.clj`.
