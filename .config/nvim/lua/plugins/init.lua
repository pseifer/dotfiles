-- Essentiall plugins.
-- See remaining files in plugins/ for more.

return {
	-- NVIM interface to tree-sitter.
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"html",
				"python",
				"clojure",
			},
		},
	},

	-- Syntax highlighting for many languages.
	"sheerun/vim-polyglot",

	-- Small plugin for seamless navigation between
	-- VIM windows and TMUX panes.
	"christoomey/vim-tmux-navigator",

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

-- TODO
-- Setup general
--    spell checker + hotkeys
-- Setup hotkeys
--    org-mode

-- Further reading and examples:
-- https://github.com/edr3x/.dotfiles/
-- https://github.com/rockerBOO/awesome-neovim
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack
