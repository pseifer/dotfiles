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

			require("util")
			nmap("<S-l>", ":BufferLineCycleNext<CR>", "next tab")
			nmap("<S-h>", ":BufferLineCyclePrev<CR>", "previous tab")
			nmap("<leader>tt", ":$tabnew<CR>", "new tab")
			nmap("<leader>tc", ":bdelete<CR>", "close tab")
			nmap("<leader>t<S-c>", ":BufferLinePickClose<CR>", "pick to close tab(s)")
			nmap("<leader>to", ":BufferLineSortByDirectory<CR>", "order tabs by directory")
			nmap("<leader>tn", ":BufferLineMoveNext<CR>", "move tab right")
			nmap("<leader>tp", ":BufferLineMovePrev<CR>", "move tab left")
			nmap("<leader><tab>", ":BufferLinePick<CR>", "pick a buffer")
			nmap("<leader>ts", ":BufferLineTogglePin<CR>", "pin tab")
		end,
	},
}
