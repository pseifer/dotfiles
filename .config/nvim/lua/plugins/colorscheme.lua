-- Contrast-based, no-clown-vomit "Zenbones" theme.

return {
	"mcchrish/zenbones.nvim",
	priority = 1000,
	dependencies = { "rktjmp/lush.nvim" },
	config = function()
		--require("zenbones").setup({
		--})
		vim.cmd("colorscheme zenbones")
		vim.o.background = "light"
		-- Background: #F0EDEC
		-- Fix BuffeLine background color (blend with main background).
		vim.cmd.hi("BufferLineFill guibg=#F0EDEC")
	end,
}
