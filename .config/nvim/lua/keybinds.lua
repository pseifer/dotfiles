-- Keybind mappings.

require("util")

-- Fundamental mappings / navigation.

-- Navigate visual lines with j/k; works well with wrapping.
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

-- Keep things centered when scrolling or jumping.
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- Remove default LSP binding for faster Telescope launch.
nmap("<leader>f", "<Nop>", "")

-- Stay in visual mode when indenting;
-- allows indenting multiple times in visual mode.
vmap("<", "<gv", "stay indent <")
vmap(">", ">gv", "stay indent >")

-- Move selected lines in visual mode with J/K.
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- Exit terminal mode with <Esc>.
tmap("<Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Void buffer mappings.

-- Delte to void with <leader>d.
nmap("<leader>d", '"_d', "Delete to void")
vmap("<leader>d", '"_d', "Delete to void")
-- Remap 'x' in visual mode to delete to void.
-- (Usually, in visual mode, x and d have the same semantics.)
vmap("x", '"_d', "Delete to void")
-- Using <leader>p, paste over without cutting.
xmap("<leader>p", '"_dP', "Paste (after deleting to void)")

-- Small utility bindings.

-- Clear search highlights using enter (another time).
nmap("<enter>", ":nohlsearch<cr>", "Clear search results")

-- Search and replace the word under the cursor.
nmap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace current word")
