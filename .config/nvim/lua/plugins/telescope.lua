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
			wk.add({
				{ "<leader>f", group = "telescope" },
				{ '<leader>f"', "<cmd>Telescope registers<cr>", desc = "Registers" },
				{ "<leader>f.", "<cmd>Telescope spell_suggest<cr>", desc = "Spell suggestion" },
				{
					"<leader>fC",
					'<cmd>Telescope find_files search_dirs={"$HOME"} hidden=true<cr>',
					desc = "Find file (hidden)",
				},
				{ "<leader>fD", "<cmd>Telescope git_commits<cr>", desc = "Search git commits" },
				{ "<leader>fE", "<cmd>Telescope file_browser<cr><esc>", desc = "File browser (project root)" },
				{ "<leader>fF", '<cmd>Telescope find_files search_dirs={"$HOME"}<cr>', desc = "Find file (~)" },
				{ "<leader>fG", '<cmd>Telescope live_grep search_dirs={"$HOME"}<cr>', desc = "Grep in files (~)" },
				{ "<leader>fP", "<cmd>Telescope repo cached_list<cr>", desc = "Search Projects (cached)" },
				{ "<leader>fR", "<cmd>Telescope repo list<cr>", desc = "Search Projects" },
				{ "<leader>fS", "<cmd>Telescope<cr>", desc = "Search Telescope" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
				{
					"<leader>fc",
					"<cmd>Telescope find_files search_dirs={'$HOME/.config/nvim'} hidden=true<cr>",
					desc = "Find file (NeoVim config)",
				},
				{ "<leader>fd", "<cmd>Telescope git_files<cr>", desc = "Search git files" },
				{
					"<leader>fe",
					"<cmd>Telescope file_browser path=%:p:help |select_buffer=true<cr><esc>|",
					desc = "File browser (current directory)",
				},
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file (project root)" },
				{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep in files (project root)" },
				{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
				{ "<leader>fi", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
				{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
				{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
				{ "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Options" },
				{
					"<leader>fp",
					'<cmd>Telescope find_files search_dirs={"$HOME/Projects"}<cr>',
					desc = "Find file (~/Projects)",
				},
				{ "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
				{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recent file" },
				{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search buffer" },
				{ "<leader>fv", "<cmd>Telescope treesitter<cr>", desc = "Treesitter" },
				{ "<leader>fx", "<cmd>Telescope commands<cr>", desc = "Commands" },
			})
			--wk.register({
			--	f = {
			--		name = "telescope",
			--		-- Meta: All modes
			--		S = { "<cmd>Telescope<cr>", "Search Telescope" },
			--		-- Files
			--		f = { "<cmd>Telescope find_files<cr>", "Find file (project root)" },
			--		F = {
			--			'<cmd>Telescope find_files search_dirs={"$HOME"}<cr>',
			--			"Find file (~)",
			--		},
			--		C = { '<cmd>Telescope find_files search_dirs={"$HOME"} hidden=true<cr>', "Find file (hidden)" },
			--		p = { '<cmd>Telescope find_files search_dirs={"$HOME/Projects"}<cr>', "Find file (~/Projects)" },
			--		d = { "<cmd>Telescope git_files<cr>", "Search git files" },
			--		-- Files (other)
			--		c = {
			--			"<cmd>Telescope find_files search_dirs={'$HOME/.config/nvim'} hidden=true<cr>",
			--			"Find file (NeoVim config)",
			--		},
			--		g = { "<cmd>Telescope live_grep<cr>", "Grep in files (project root)" },
			--		G = { '<cmd>Telescope live_grep search_dirs={"$HOME"}<cr>', "Grep in files (~)" },
			--		R = { "<cmd>Telescope repo list<cr>", "Search Projects" },
			--		P = { "<cmd>Telescope repo cached_list<cr>", "Search Projects (cached)" },
			--		r = { "<cmd>Telescope oldfiles<cr>", "Find recent file" },
			--		e = {
			--			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr><esc>",
			--			"File browser (current directory)",
			--		},
			--		E = { "<cmd>Telescope file_browser<cr><esc>", "File browser (project root)" },
			--		-- Vim
			--		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			--		s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
			--		h = { "<cmd>Telescope help_tags<cr>", "Help" },
			--		x = { "<cmd>Telescope commands<cr>", "Commands" },
			--		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			--		o = { "<cmd>Telescope vim_options<cr>", "Options" },
			--		-- Basic vim tools
			--		['"'] = { "<cmd>Telescope registers<cr>", "Registers" },
			--		m = { "<cmd>Telescope marks<cr>", "Marks" },
			--		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
			--		i = { "<cmd>Telescope diagnostics<cr>", "Find diagnostics" },
			--		--l = { "<cmd>Telescope loclist<cr>", "Loclist" },
			--		-- Other
			--		["."] = { "<cmd>Telescope spell_suggest<cr>", "Spell suggestion" },
			--		v = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
			--		D = { "<cmd>Telescope git_commits<cr>", "Search git commits" },
			--	},
			--}, { prefix = "<leader>" })
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
