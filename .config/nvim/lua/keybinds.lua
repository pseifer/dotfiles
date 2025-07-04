-- Keybind mappings.

-- Fundamental mappings / navigation.

-- Navigate visual lines with j/k; works well with wrapping.
Nmap("j", "gj", "visual line down")
Nmap("k", "gk", "visual line up")

-- These mirror tmux hotkeys for moving and resizing,
-- but use C-w instead of C-a (my tmux leader).
Nmap("<C-w>h", "<C-w><S-h>", "Move window left")
Nmap("<C-w>j", "<C-w><S-j>", "Move window down")
Nmap("<C-w>k", "<C-w><S-k>", "Move window up")
Nmap("<C-w>l", "<C-w><S-l>", "Move window right")
Nmap("<C-w><S-l>", ":vertical-resize +10<CR>", "Resize left")
Nmap("<C-w><S-k>", ":resize -10<CR>", "Resize down")
Nmap("<C-w><S-j>", ":resize +10<CR>", "Resize up")
Nmap("<C-w><S-h>", ":vertical-resize -10<CR>", "Resize right")

-- Keep things centered when scrolling or jumping.
Nmap("<C-d>", "<C-d>zz")
Nmap("<C-u>", "<C-u>zz")
Nmap("n", "nzzzv")
Nmap("N", "Nzzzv")

-- Remove default LSP binding for faster Telescope launch.
Nmap("<leader>f", "<Nop>", "")

-- Stay in visual mode when indenting;
-- allows indenting multiple times in visual mode.
Vmap("<", "<gv", "stay indent <")
Vmap(">", ">gv", "stay indent >")

-- Move selected lines in visual mode with J/K.
Vmap("J", ":m '>+1<CR>gv=gv")
Vmap("K", ":m '<-2<CR>gv=gv")

-- Exit terminal mode with <Esc>.
Tmap("<Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Highlight yank autocommand.
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight text when tanking",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Void buffer mappings.

-- Delte to void with <leader>d.
Nmap("<leader>d", '"_d', "Delete to void")
Vmap("<leader>d", '"_d', "Delete to void")
-- Remap 'd' in visual mode to delete to void.
-- (Usually, in visual mode, x and d have the same semantics.)
Vmap("d", '"_d', "Delete to void")
-- Using <leader>p, paste over without cutting.
Xmap("<leader>p", '"_dP', "Paste (after deleting to void)")

-- Lua-Neovim-Dev bindings.

Nmap("<leader><leader>x", "<cmd>source %<CR>", "Evaluate source file (Lua)")
Nmap("<leader><leader>l", ":.lua<CR>", "Evaluate line (Lua)")
Vmap("<leader><leader>l", ":lua<CR>", "Evaluate selection (Lua)")

-- Small utility bindings.

-- Clear search highlights using enter (another time)
Nmap("<leader>/", ":nohlsearch<CR>", "Clear search results")

-- Move around.
Nmap("<ENTER>", "$", "Move to end of line")
Nmap("<BS>", "^", "Move to first non-blank character")

-- Search and replace the word under the cursor.
Nmap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace current word")

-- Go to next or previous diagnostict.
Nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
Nmap("[d", vim.diagnostic.goto_prev, "Go to next diagnostic")
Nmap("gh", vim.diagnostic.open_float, "Open diagnostic")

-- TODO: Think of something useful for 's'

-- Edit the spelling dictionary file.
Nmap("<leader>lS", ":edit ~/.local/share/ltex/ltex.dictionary.en-US.txt<CR>", "Edit spelling dictionary")
