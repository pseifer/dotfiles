return {
	"tpope/vim-fugitive",
	config = function()
		require("util")
		nmap("<leader>g", vim.cmd.Git, "Fugitive")
	end,
}
