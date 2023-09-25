-- Basic, toggleable settings.

local go = vim.o                                -- Global.

go.termguicolors = true                         -- Enable true colors.
vim.cmd 'colorscheme dracula'                   -- Set color scheme to Dracula.

go.showmatch = true                             -- Highlight matching parens.
go.inccommand = split                           -- Preview replacements in split.

go.clipboard = 'unnamedplus'                    -- Use system clipboard.

go.wildmode = 'longest,list'                    -- Completion.
go.completeopt = 'menuone,noinsert,noselect'    -- IDE-like completion.

go.splitbelow = true                            -- Splitting (below).
go.splitright = true                            -- Splitting (right).
go.title = true

go.ignorecase = true                            -- Case insensitive search...
go.smartcase = true                             -- ...unless upper case is used.

go.undofile = true                              -- Save undo info in files.
go.undodir = vim.fn.expand('~/.vim-undo')       -- Directory for saving undo.
go.undolevels = 10000                           -- Limit to 10.000 levels.

local wo = vim.wo                               -- Local to Window.

-- wo.cc = 80         -- 
wo.cursorline = true                            -- Highlight the curent cursor line.

local bo = vim.bo                               -- Local to Buffer.

bo.expandtab = true                             -- Use 4 spaces for tabs.
bo.tabstop = 4                                  -- "
bo.shiftwidth = 4                               -- "

-- General (vim.opt) options.

vim.opt.signcolumn = "yes"                      -- Always show the signcolumn.

