-- Keybind mappings.

require("util")

-- Remove search highlights with enter.
nmap("<enter>", ":nohlsearch<cr>", "Clear search results")

-- Search highlighted term.
nmap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace word")

-- Fundamental mappings / navigation.

-- Navigate visual lines with j/k.
nmap("j", "gj", "visual line down")
nmap("k", "gk", "visual line up")

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

-- Keep things centered.
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- Remove default LSP binding for faster Telescope launch.
nmap("<leader>f", "<Nop>", "")

-- Stay in visual mode when indenting.
vmap("<", "<gv", "stay indent <")
vmap(">", ">gv", "stay indent >")

-- Move lines in visual mode with J/K.
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- Exit terminal mode with <Esc>.
tmap("<Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Delete to void.
nmap("d", '"_d', "Delete to void")
vmap("d", '"_d', "Delete to void")
xmap("<leader>p", '"_dP', "Overpaste to void")
