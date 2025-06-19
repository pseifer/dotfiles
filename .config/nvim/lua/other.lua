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

-- Set color for various floating windows.
local set_hl_for_floating_window = function()
	local color = "#e9e4e2" -- The color to use (here: Zenbones - current line)

	modify_hl(0, "NormalFloat", { bg = color })
	modify_hl(0, "FloatBorder", { bg = color })
	modify_hl(0, "WhichKeyFloat", { bg = color })
	modify_hl(0, "Pmenu", { bg = color })

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

-- Set title to date for new diary entries.
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*/diary/[0-9]*.md",
	command = ':0r!echo "\\# `date +\\%d.\\%m.\\%Y`\\n:daily:\\n"',
})

-- Replace leading '/' in markdown links on save, only in vimwiki.
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function(opts)
		if vim.bo[opts.buf].filetype == "vimwiki" then
			-- %s:\[\(.*\)\](\/\(.*\)):[\1](\2):g
			vim.cmd(":silent %s:\\(\\[.*\\]\\)(\\/\\(.*\\)):\\1(\\2):ge")
		end
	end,
})
