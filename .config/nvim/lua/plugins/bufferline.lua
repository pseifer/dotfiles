-- Configuration for BufferLine.

return {
	{
		"akinsho/bufferline.nvim",
		--lazy = false,
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					show_buffer_icons = false,
					buffer_close_icon = " ",
				},
			})

			local wk = require("which-key")
			wk.register({
				t = {
					name = "tabs",
					t = { ":$tabnew<CR>", "new tab" },
					c = { ":bdelete<CR>", "close tab" },
					C = { ":BufferLinePickClose<CR>", "pick to close tab(s)" },
					o = { ":BufferLineSortByDirectory<CR>", "order tabs by directory" },
					n = { ":BufferLineMoveNext<CR>", "move tab right" },
					p = { ":BufferLineMovePrev<CR>", "move tab left" },
					s = { ":BufferLineTogglePin<CR>", "pin tab" },
				},
			}, { prefix = "<leader>" })

			Nmap("<S-l>", ":BufferLineCycleNext<CR>", "next tab")
			Nmap("<S-h>", ":BufferLineCyclePrev<CR>", "previous tab")
			Nmap("<leader><tab>", ":BufferLinePick<CR>", "pick a buffer")
		end,
	},
}
