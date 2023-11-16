-- Configuration for the Telescope fuzzy finder.
-- > This is the univeral finding and navigation tool of my setup.

return {
	{
		-- The core Telescope plugin.
		"nvim-telescope/telescope.nvim",
		version = "0.1.3",
		dependencies = {
			-- A general LUA library.
			"nvim-lua/plenary.nvim",
		},
		config = function()
			-- local builtin = require('telescope.builtin')
			local wk = require("which-key")

			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("fzf")

			wk.register({
				f = {
					name = "telescope",
					-- Meta: All modes
					t = { "<cmd>Telescope<cr>", "Search Telescope" },
					-- Files
					f = { "<cmd>Telescope find_files<cr>", "Find file (project root)" },
					F = { '<cmd>Telescope find_files search_dirs={"$HOME"}<cr>', "Find file (~)" },
					c = {
						"<cmd>Telescope find_files search_dirs={'$HOME/.config/nvim'} hidden=true<cr>",
						"Find file (NeoVim config)",
					},
					C = { '<cmd>Telescope find_files search_dirs={"$HOME"} hidden=true<cr>', "Find file (hidden)" },
					w = {
						"<cmd>Telescope find_files search_dirs={'$HOME/Notes'}<cr>",
						"Find file (VimWiki)",
					},
					W = {
						"<cmd>Telescope live_grep search_dirs={'$HOME/Notes'}<cr>",
						"Grep files (VimWiki)",
					},
					g = { "<cmd>Telescope live_grep<cr>", "Grep in files (project root)" },
					G = { '<cmd>Telescope live_grep search_dirs={"$HOME"}<cr>', "Grep in files (~)" },
					p = { "<cmd>Telescope repo list bin=/usr/bin/fdfind<cr>", "Search Projects" },
					P = { "<cmd>Telescope repo cached_list<cr>", "Search Projects" },
					r = { "<cmd>Telescope oldfiles<cr>", "Find recent file" },
					e = {
						"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
						"File browser (current directory)",
					},
					E = { "<cmd>Telescope file_browser<cr>", "File browser (project root)" },
					-- Vim
					b = { "<cmd>Telescope buffers<cr>", "Buffers" },
					s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
					h = { "<cmd>Telescope help_tags<cr>", "Help" },
					x = { "<cmd>Telescope commands<cr>", "Commands" },
					k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
					o = { "<cmd>Telescope vim_options<cr>", "Options" },
					-- Other
					q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
					i = { "<cmd>Telescope diagnostics<cr>", "Find diagnostics" },
					["."] = { "<cmd>Telescope spell_suggest<cr>", "Spell suggestion" },
					v = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
					d = { "<cmd>DevdocsOpenCurrentFloat<cr>", "Devdocs" },
					D = { "<cmd>DevdocsOpenCurrent<cr>", "Devdocs" },
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
	},
	-- Devdocs browser for Telescope.
	{
		"luckasRanarison/nvim-devdocs",
		opts = {
			wrap = true,
			previewer_cmd = "glow",
			cmd_args = { "-s", "dark", "-w", "80" },
			picker_cmd = "glow",
			picker_cmd_args = { "-s", "dark", "-w", "50" },
			-- Floating window to the right.
			float_win = {
				relative = "editor",
				height = 25,
				width = 100,
				border = "none",
			},
			--  ensure_installed = {}
		},
	},
}

-- See also https://github.com/nvim-telescope/telescope.nvim
