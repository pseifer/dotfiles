-- Configuration for org-mode, VIM edition.

return {
	"nvim-orgmode/orgmode",
	-- dependencies = {
	-- 	{ "nvim-treesitter/nvim-treesitter", lazy = true },
	-- },
	--event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		-- Load custom treesitter grammar for org filetype
		-- require("orgmode").setup_ts_grammar()

		-- Treesitter configuration
		require("nvim-treesitter.configs").setup({
			-- If TS highlights are not enabled at all, or disabled via `disable` prop,
			-- highlighting will fallback to default Vim syntax highlighting
			highlight = {
				enable = true,
				-- Required for spellcheck, some LaTex highlights and
				-- code block highlights that do not have ts grammar
				additional_vim_regex_highlighting = { "org" },
			},
			ensure_installed = { "org" },
		})

		require("orgmode").setup({
			org_agenda_files = { "~/Org/*" },
			org_default_notes_file = "~/Org/misc.org",
			mappings = {
				org = {
					org_toggle_checkbox = "<Leader><Space>",
				},
			},
		})

		wk.register({
			o = {
				name = "org",
			},
		}, { prefix = "<leader>" })
	end,
}
