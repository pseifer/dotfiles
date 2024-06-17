-- Simple zen mode.

return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backgrop = 1,
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				-- cursorline = false, -- disable cursorline
				-- cursorcolumn = false, -- disable cursor column
				-- foldcolumn = "0", -- disable fold column
				-- list = false, -- disable whitespace characters
			},
		},
	},
	init = function()
		local wk = require("which-key")
		wk.register({
			z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
		}, { prefix = "<leader>" })
	end,
}
