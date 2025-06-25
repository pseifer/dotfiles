return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Manual invoke formatting.
			"<leader>lF",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format (Conform)",
		},
	},

	opts = {
		-- Define the formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			c = { "clang-format" },
		},

		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 },

		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},

	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
