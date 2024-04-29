-- Essentiall plugins.
-- See remaining files in plugins/ for more.

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

	-- Syntax highlighting for many languages.
	"sheerun/vim-polyglot",

	-- Small plugin for seamless navigation between
	-- VIM windows and TMUX panes.
	--"christoomey/vim-tmux-navigator",
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
			require("util")
			nmap("<C-h>", "<CMD>NavigatorLeft<CR>")
			nmap("<C-l>", "<CMD>NavigatorRight<CR>")
			nmap("<C-k>", "<CMD>NavigatorUp<CR>")
			nmap("<C-j>", "<CMD>NavigatorDown<CR>")
			nmap("<C-p>", "<CMD>NavigatorPrevious<CR>")
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
	-- This is used for managing keybinds, that provide documentation.
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
