-- Plugin for using linters with built in LSP.
-- Linters are installed via Mason (see mason.lua).

return {
	"mfussenegger/nvim-lint",
	config = function()
		-- Setup linters.
		-- https://github.com/mfussenegger/nvim-lint
		require("lint").linters_by_ft = {
			sh = { "shellcheck" },
			git = { "gitlint" },
			make = { "checkmake" },
			-- lua = { "luacheck" },
		}

		-- Run on save.
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
				vim.cmd(":FormatWrite")
			end,
		})
	end,
}
