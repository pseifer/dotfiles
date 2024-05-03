-- Browse files edit history with "<leader>u".

return {
	"mbbill/undotree",
	config = function()
		Nmap("<leader>u", vim.cmd.UndotreeToggle, "undo(tree)")
	end,
}
