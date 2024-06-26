-- Configuration for the Telescope fuzzy finder.
-- - This is the universal finding and navigation tool of my setup.
-- - This uses the prefix <leader>f for everything.

return {
	{
		-- The core Telescope plugin.
		"nvim-telescope/telescope.nvim",
		version = "0.1.3",
		dependencies = {
			-- A general lua library for interfaces.
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("fzf")

			local wk = require("which-key")
			wk.register({
				f = {
					name = "telescope",
					-- Meta: All modes
					S = { "<cmd>Telescope<cr>", "Search Telescope" },
					-- Files
					f = { "<cmd>Telescope find_files<cr>", "Find file (project root)" },
					F = {
						'<cmd>Telescope find_files search_dirs={"$HOME"}<cr>',
						"Find file (~)",
					},
					C = { '<cmd>Telescope find_files search_dirs={"$HOME"} hidden=true<cr>', "Find file (hidden)" },
					p = { '<cmd>Telescope find_files search_dirs={"$HOME/Projects"}<cr>', "Find file (~/Projects)" },
					d = { "<cmd>Telescope git_files<cr>", "Search git files" },
					-- Files (other)
					c = {
						"<cmd>Telescope find_files search_dirs={'$HOME/.config/nvim'} hidden=true<cr>",
						"Find file (NeoVim config)",
					},
					g = { "<cmd>Telescope live_grep<cr>", "Grep in files (project root)" },
					G = { '<cmd>Telescope live_grep search_dirs={"$HOME"}<cr>', "Grep in files (~)" },
					R = { "<cmd>Telescope repo list<cr>", "Search Projects" },
					P = { "<cmd>Telescope repo cached_list<cr>", "Search Projects (cached)" },
					r = { "<cmd>Telescope oldfiles<cr>", "Find recent file" },
					e = {
						"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr><esc>",
						"File browser (current directory)",
					},
					E = { "<cmd>Telescope file_browser<cr><esc>", "File browser (project root)" },
					-- Vim
					b = { "<cmd>Telescope buffers<cr>", "Buffers" },
					s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
					h = { "<cmd>Telescope help_tags<cr>", "Help" },
					x = { "<cmd>Telescope commands<cr>", "Commands" },
					k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
					o = { "<cmd>Telescope vim_options<cr>", "Options" },
					-- Basic vim tools
					['"'] = { "<cmd>Telescope registers<cr>", "Registers" },
					m = { "<cmd>Telescope marks<cr>", "Marks" },
					q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
					i = { "<cmd>Telescope diagnostics<cr>", "Find diagnostics" },
					--l = { "<cmd>Telescope loclist<cr>", "Loclist" },
					-- Other
					["."] = { "<cmd>Telescope spell_suggest<cr>", "Spell suggestion" },
					v = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
					D = { "<cmd>Telescope git_commits<cr>", "Search git commits" },
				},
			}, { prefix = "<leader>" })
		end,
	},

	-- A file browser for Telescope.
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- Native FZF written in C for Telescope.
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	-- A repository finder for Telescope.
	{
		"cljoly/telescope-repo.nvim",
		config = function()
			require("telescope").load_extension("repo")
		end,
	},
}
