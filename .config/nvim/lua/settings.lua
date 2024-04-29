-- Global settings.

local go = vim.o

go.showmode = false
go.termguicolors = true -- Enable true colors.

go.showmatch = true -- Highlight matching parens.
go.inccommand = "split" -- Preview replacements in split.
go.so = 15 -- keep cursor middle(ish) of screen

go.clipboard = "unnamedplus" -- Use system clipboard.

go.wildmode = "longest,list" -- Completion.
go.completeopt = "menuone,noinsert,noselect" -- IDE-like completion.

go.splitbelow = true -- Splitting (below).
go.splitright = true -- Splitting (right).
go.title = true

go.ignorecase = true -- Case insensitive search...
go.smartcase = true -- ...unless upper case is used.

go.undofile = true -- Save undo info in files.
go.undodir = vim.fn.expand("~/.vim-undo") -- Directory for saving undo.
go.undolevels = 10000 -- Limit to 10.000 levels.

-- Folding settings.
-- go.foldcolumn = "1"
-- go.foldlevel = 99
go.foldmethod = "syntax"
go.foldexpr = "nvim_treesitter#foldexpr()"
go.foldlevelstart = 99
go.foldenable = true

-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.wo.foldmethod = "expr"
--
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"
--vim.o.foldmethod = "expr"

-- Window-local settings.

local wo = vim.wo

-- wo.cc = 80         -- highlight column 80
wo.cursorline = true -- Highlight the curent cursor line.
wo.rnu = true -- set relative line numbers

-- Buffer-local settings.

local bo = vim.bo

bo.expandtab = true -- Use 4 spaces for tabs.
bo.tabstop = 4 -- "
bo.shiftwidth = 4 -- "
bo.softtabstop = 4

-- General (vim.opt) options.

vim.opt.signcolumn = "yes" -- Always show the signcolumn.
