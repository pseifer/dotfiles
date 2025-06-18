-- Configure builtin Neovim settings.

-- Note: Use <leader>fh for documentation access.

-- Global settings.

local go = vim.o

go.showmode = false -- Do not show the builting --NORMAL--, --INSERT--, et. al
go.termguicolors = true -- Enable true colors.

go.showmatch = true -- Highlight matching parens.
go.inccommand = "split" -- Preview subsitutions (e.g. ':%s:this:that')  in split.
go.so = 15 -- Keep cursor middle(ish) of screen.

go.clipboard = "unnamedplus" -- Use the system clipboard.

go.wildmode = "longest,list" -- Completion.
go.completeopt = "menuone,noinsert,noselect" -- IDE-like completion.

go.splitbelow = true -- Put split below.
go.splitright = true -- Put split to the right.
go.title = true -- Set title to filename.

go.ignorecase = true -- Case insensitive search by default...
go.smartcase = true -- ...unless upper case is used.

go.undofile = true -- Save undo info in files.
go.undodir = vim.fn.expand("~/.vim-undo") -- Directory for saving undo.
go.undolevels = 10000 -- Limit to 10.000 levels.

-- Coe folding settings.
-- go.foldcolumn = "1"
-- go.foldlevel = 99
go.foldmethod = "manual"
go.foldexpr = "nvim_treesitter#foldexpr()"
go.foldlevelstart = 99
go.foldenable = true
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.wo.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"
--vim.o.foldmethod = "expr"

go.messagesopt = "wait:0,history:500"

-- Window-local settings.

local wo = vim.wo

-- wo.cc = 80         -- Highlight column 80.
wo.cursorline = true -- Highlight the curent cursor line.
wo.rnu = true -- Enable relative line numbers.
wo.signcolumn = "number" -- Always show the signcolumn over row number.

-- Buffer-local settings.

local bo = vim.bo

-- Use 4 spaces for tabs.
bo.expandtab = true
bo.tabstop = 4
bo.shiftwidth = 4
bo.softtabstop = 4
