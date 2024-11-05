-- Configuration for LuaLine.

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		require("lualine").setup({
			separator = nil,
			options = {
				component_separators = "",
				section_separators = "",
				-- theme = "zenbones",
			},
		})
	end,
}
