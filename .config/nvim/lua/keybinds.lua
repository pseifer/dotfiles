-- Keybind mappings.

require("util")

-- Remove search highlights with enter.
nmap("<enter>", ":nohlsearch<cr>", "clear search results")

-- Fundamental mappings / navigation.

-- Navigate visual lines with j/k.
nmap("j", "gj", "visual line down")
nmap("k", "gk", "visual line up")

-- Navigate buffers and tabs.
nmap("<leader>n", ":bnext<cr>", "next buffer")
nmap("<leader>p", ":bprev<cr>", "previous buffer")
nmap("<S-l>", ":tabn<CR>", "next tab")
nmap("<S-h>", ":tabp<CR>", "previous tab")

-- Manage tabs.
nmap("<leader>tt", ":$tabnew<CR>", "new tab")
nmap("<leader>tc", ":tabclose<CR>", "close tab")
nmap("<leader>to", ":tabclose<CR>", "only - close other tabs")
nmap("<leader>tn", ":+tabmove<CR>", "move tab right")
nmap("<leader>tp", ":-tabmove<CR>", "move tab left")

-- These mirror tmux hotkeys for moving and resizing,
-- but use C-w instead of C-a (my tmux leader).
nmap("<C-w>h", "<C-w><S-h>", "Move window left")
nmap("<C-w>j", "<C-w><S-j>", "Move window down")
nmap("<C-w>k", "<C-w><S-k>", "Move window up")
nmap("<C-w>l", "<C-w><S-l>", "Move window right")

nmap("<C-w><S-l>", ":vertical-resize +10<CR>", "Resize left")
nmap("<C-w><S-k>", ":resize -10<CR>", "Resize down")
nmap("<C-w><S-j>", ":resize +10<CR>", "Resize up")
nmap("<C-w><S-h>", ":vertical-resize -10<CR>", "Resize right")

-- Remove default LSP binding for faster Telescope launch.
nmap("<leader>f", "<Nop>", "")

-- Stay in visual mode when indenting.
vmap("<", "<gv", "stay indent <")
vmap(">", ">gv", "stay indent >")
