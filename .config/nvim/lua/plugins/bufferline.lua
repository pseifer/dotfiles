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
			wk.add({
				{ "<leader>t", group = "tabs" },
				{ "<leader>tC", ":BufferLinePickClose<CR>", desc = "pick to close tab(s)" },
				{ "<leader>tc", ":bdelete<CR>", desc = "close tab" },
				{ "<leader>tn", ":BufferLineMoveNext<CR>", desc = "move tab right" },
				{ "<leader>to", ":BufferLineSortByDirectory<CR>", desc = "order tabs by directory" },
				{ "<leader>tp", ":BufferLineMovePrev<CR>", desc = "move tab left" },
				{ "<leader>ts", ":BufferLineTogglePin<CR>", desc = "pin tab" },
				{ "<leader>tt", ":$tabnew<CR>", desc = "new tab" },
			})

			Nmap("<S-l>", ":BufferLineCycleNext<CR>", "next tab")
			Nmap("<S-h>", ":BufferLineCyclePrev<CR>", "previous tab")
			Nmap("<leader><tab>", ":BufferLinePick<CR>", "pick a buffer")
		end,
	},
}
