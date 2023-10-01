-- Patch the background color of floating windows.

function modify_hl(ns, name, changes)
	local def = vim.api.nvim_get_hl(ns, { name = name, link = false })
	vim.api.nvim_set_hl(ns, name, vim.tbl_deep_extend("force", def, changes))
end

local set_hl_for_floating_window = function()
	modify_hl(0, "NormalFloat", { bg = "#44475a" }) -- Dracula: Current row
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "Avoid overwritten by loading color schemes later",
	callback = set_hl_for_floating_window,
})

-- Open telescope file browser when opening directories.

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local path = vim.fn.expand("<afile>")
		print(path)
		if vim.fn.argc(-1) == 1 and vim.fn.isdirectory(path) == 1 then
			vim.api.nvim_buf_delete(0, { force = true })
			require("telescope").extensions.file_browser.file_browser()
		end
	end,
})
