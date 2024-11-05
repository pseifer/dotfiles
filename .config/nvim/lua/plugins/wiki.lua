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

			wk.add({
				{ "<leader>n", group = "notes" },
				{
					"<leader>nO",
					"<cmd>Telescope grep_string use_regex=true disable_coordinates=true path_display='hidden' only_sort_text=true search=\\#[^\\s\\#]<cr>",
					desc = "Open note by tag",
				},
				{
					"<leader>nT",
					"<cmd>Telescope grep_string use_regex=true disable_coordinates=true path_display='hidden' only_sort_text=true search=^\\\\s*\\-\\ \\[x\\]<cr>",
					desc = "Find completed task",
				},
				{ "<leader>nc", "<cmd>VimwikiToggleListItem<cr>", desc = "Checkmark task (toggle)" },
				{ "<leader>nn", "<cmd>VimwikiIndex<cr>", desc = "Go to index" },
				{
					"<leader>no",
					"<cmd>Telescope grep_string use_regex=true disable_coordinates=true only_sort_text=true path_display='hidden' search=^\\#\\ <cr>",
					desc = "Open note title",
				},
				{
					"<leader>nt",
					"<cmd>Telescope grep_string use_regex=true disable_coordinates=true path_display='hidden' only_sort_text=true search=^\\\\s*\\-\\ \\[\\ \\]<cr>",
					desc = "Find task",
				},
			})
		end,
	},
}
