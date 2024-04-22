-- Keybind mappings.

require("util")

-- Remove search highlights with enter.
nmap("<enter>", ":nohlsearch<cr>", "clear search results")

-- Fundamental mappings / navigation.

-- Navigate visual lines with j/k.
nmap("j", "gj", "visual line down")
nmap("k", "gk", "visual line up")

-- Navigate buffers and tabs.
-- nmap("<leader>n", ":bnext<cr>", "next buffer")
-- nmap("<leader>p", ":bprev<cr>", "previous buffer")

-- Manage tabs (buffers).
nmap("<S-l>", ":BufferNext<CR>", "next tab")
nmap("<S-h>", ":BufferPrevious<CR>", "previous tab")
nmap("<leader>tt", ":$tabnew<CR>", "new tab")
nmap("<leader>tc", ":BufferClose<CR>", "close tab")
nmap("<leader>t<S-c>", ":BufferPickDelete<CR>", "pick to close tab(s)")
nmap("<leader>to", ":BufferOrderByDirectory<CR>", "order tabs by directory")
nmap("<leader>tn", ":BufferMoveNext<CR>", "move tab right")
nmap("<leader>tp", ":BufferMovePrevious<CR>", "move tab left")
nmap("<leader><tab>", ":BufferPick<CR>", "pick a buffer")
nmap("<leader>ts", ":BufferPin<CR>", "pin tab")

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
