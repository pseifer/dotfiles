-- Zen mode with a few different modes.
-- - Ataraxis: Full focus mode.
-- - Focus Window: Zoom in on one window.
-- - Focus Line: Zoom in on line(s).

return {
	"Pocco81/true-zen.nvim",
	config = function()
		require("true-zen").setup({
			integrations = {
				lualine = true,
			},
		})
		local wk = require("which-key")
		wk.register({
			z = {
				name = "zen",
				a = { "<cmd>TZAtaraxis<cr>", "Ataraxis Mode" },
				f = { "<cmd>TZFocus<cr>", "Focus Window" },
				n = { "<cmd>TZNarrow<cr>", "Focus Line" },
			},
		}, { prefix = "<leader>" })
		wk.register({
			z = {
				name = "zen",
				n = { "<cmd>'<,'>TZNarrow<cr>", "Focus Lines" },
			},
		}, { mode = "v", prefix = "<leader>" })
	end,
}
