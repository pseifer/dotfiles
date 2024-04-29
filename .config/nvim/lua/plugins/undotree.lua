return {
	"mbbill/undotree",
	config = function()
		require("util")
		nmap("<leader>u", vim.cmd.UndotreeToggle, "undo(tree)")
	end,
}
