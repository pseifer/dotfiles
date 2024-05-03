-- Test runner framework.

return {
	"nvim-neotest/neotest",
	dependencies = {
		-- Core dependencies.
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		-- Adapters.
		"mrcjkb/neotest-haskell",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-haskell"),
			},
		})
	end,
}
