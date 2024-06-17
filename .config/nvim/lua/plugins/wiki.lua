-- Configuration for VimWiki.

return {
	-- Vimwiki
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{
					path = "~/Notes/home",
					syntax = "markdown",
					ext = ".md",
					-- If there is a header '## Contents', auto-update TOC.
					toc_header_level = 2,
					auto_toc = 1,
				},
			}

			vim.g.vimwiki_global_ext = 0
			vim.g.vimwiki_folding = "syntax"

			-- use 'nb' style check mark for completed tasks.
			vim.g.vimwiki_listsyms = " .oOx"

			-- Custom keybindings
			local wk = require("which-key")
			wk.register({
				n = {
					name = "notes",
					c = { "<cmd>VimwikiToggleListItem<cr>", "Checkmark task (toggle)" },
					n = { "<cmd>VimwikiIndex<cr>", "Go to index" },
					o = {
						-- Grep all lines that are titles, and fuzzy filter.
						"<cmd>Telescope grep_string use_regex=true disable_coordinates=true only_sort_text=true path_display='hidden' search=^\\#\\ <cr>",
						"Open note title",
					},
					O = {
						-- Grep all lines that have tags (starting with #), and fuzzy filter.
						"<cmd>Telescope grep_string use_regex=true disable_coordinates=true path_display='hidden' only_sort_text=true search=\\#[^\\s\\#]<cr>",
						"Open note by tag",
					},
					t = {
						-- Grep all lines starting with whitespace followed by "- [ ]".
						-- Then, fuzzy search this list.
						"<cmd>Telescope grep_string use_regex=true disable_coordinates=true path_display='hidden' only_sort_text=true search=^\\\\s*\\-\\ \\[\\ \\]<cr>",
						"Find task",
					},
					T = {
						-- Same as 't', but for completed tasks. Note: Using 'x', see listsyms above.
						"<cmd>Telescope grep_string use_regex=true disable_coordinates=true path_display='hidden' only_sort_text=true search=^\\\\s*\\-\\ \\[x\\]<cr>",
						"Find completed task",
					},
				},
			}, { prefix = "<leader>" })
		end,
	},
}
