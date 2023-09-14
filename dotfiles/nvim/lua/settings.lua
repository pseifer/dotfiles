-- Basic, toggleable settings.

vim.cmd 'colorscheme dracula'                   -- Set color scheme to Dracula.

local go = vim.o                                -- Global.

go.termguicolors = true                         -- Enable true colors.

go.showmatch = true                             -- Highlight matching parens.
go.inccommand = split                           -- Preview replacements in split.

go.clipboard = "unnamedplus"                    -- Use system clipboard.

go.wildmode = "longest,list"                    -- Completion.
go.completeopt = "menuone,noinsert,noselect"    -- IDE-like completion.

go.splitbelow = true                            -- Splitting (below).
go.splitright = true                            -- Splitting (right).
go.title = true

go.ignorecase = true                            -- Case insensitive search...
go.smartcase = true                             -- ...unless upper case is used.

local wo = vim.wo                               -- Local to Window.

-- wo.cc = 80         -- 
wo.cursorline = true                            -- Highlight the curent cursor line.

local bo = vim.bo                               -- Local to Buffer.

bo.expandtab = true                             -- Use 4 spaces for tabs.
bo.tabstop = 4                                  -- "
bo.shiftwidth = 4                               -- "


