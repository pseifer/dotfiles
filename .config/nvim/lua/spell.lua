-- Setup spell checking.
--
-- Relevant keybindings
-- ]s / [s 		next or previous misspelled word
-- z=					suggest fix/alternative
-- 	:spellr		repeat for all words in window
-- zg					add word to spell list
-- 2zg				use local spellfile
-- zw					mark word as incorrect
-- zug/zuw		undo zg/zw

vim.g.vimtex_syntax_nospell_comments = 1 -- disable for comments

-- Set the spell file; the local file is used with, e.g., '2zg'.
local primary_spellfile = vim.fn.expand("~/.config/nvim/spell/en.utf-8.add")
local local_spellfile = vim.fn.expand(".spell.utf-8.add")
vim.opt.spellfile = primary_spellfile .. "," .. local_spellfile

-- Filetypes to enable spellcheck
local spell_types = { "text", "plaintex", "typst", "gitcommit" } --, "markdown" , "tex", "latex" }

-- Set global spell option to false initially to disable it for all file types
vim.opt.spell = false

-- Create an augroup for spellcheck to group related autocommands
vim.api.nvim_create_augroup("Spellcheck", { clear = true })

-- Create an autocommand to enable spellcheck for specified file types
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "Spellcheck", -- Grouping the command for easier management
	pattern = spell_types, -- Only apply to these file types
	callback = function()
		vim.opt_local.spell = true -- Enable spellcheck for these file types
		vim.opt_local.spelllang = "en_us"
	end,
	desc = "Enable spellcheck for defined filetypes", -- Description for clarity
})
