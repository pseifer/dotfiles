-- Other custom functions, etc.

-- Open telescope file browser when opening directories.

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local path = vim.fn.expand("<afile>")
		if vim.fn.argc(-1) == 1 and vim.fn.isdirectory(path) == 1 then
			vim.api.nvim_buf_delete(0, { force = true })
			require("telescope.builtin").find_files()
		end
	end,
})

-- Patch the background color of floating windows.

local function modify_hl(ns, name, changes)
	local def = vim.api.nvim_get_hl(ns, { name = name, link = false })
	vim.api.nvim_set_hl(ns, name, vim.tbl_deep_extend("force", def, changes))
end

-- Set color for floating windows.
local set_hl_for_floating_window = function()
	modify_hl(0, "NormalFloat", { bg = "#f0edec" })
	modify_hl(0, "FloatBorder", { bg = "#f0edec" })
	modify_hl(0, "WhichKeyFloat", { bg = "#ddd6d3" })
	vim.diagnostic.config({
		float = { border = "rounded" },
	})
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "Avoid overwritten by loading color schemes later.",
	callback = set_hl_for_floating_window,
})
