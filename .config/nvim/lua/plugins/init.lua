-- Essentiall plugins.
-- See remaining files in 'plugins' for more.

return {
	-- NVIM interface to tree-sitter.
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"bibtex",
				"c",
				"clojure",
				"csv",
				"haskell",
				"html",
				"lua",
				"python",
				"scala",
				"vim",
				"vimdoc",
				"xml",
			},
		},
	},

	-- Basic syntax highlighting for many languages.
	"sheerun/vim-polyglot",

	-- Small plugin for seamless navigation between
	-- VIM windows and TMUX panes.
	-- Alternative: "christoomey/vim-tmux-navigator"
	-- Navigator.nvim works with other tools, e.g, WezTerm.
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
			Nmap("<C-h>", "<CMD>NavigatorLeft<CR>")
			Nmap("<C-l>", "<CMD>NavigatorRight<CR>")
			Nmap("<C-k>", "<CMD>NavigatorUp<CR>")
			Nmap("<C-j>", "<CMD>NavigatorDown<CR>")
			Nmap("<C-p>", "<CMD>NavigatorPrevious<CR>")
		end,
	},

	-- Rooter: Updates working directory to project root.
	{
		"airblade/vim-rooter",
		config = function()
			vim.g.rooter_cd_cmd = "lcd"
		end,
	},

	-- Keybindings/Documentation
	-- This is used for managing keybinds that provide documentation
	-- in a special buffer, similar to Spacemacs.
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
}
