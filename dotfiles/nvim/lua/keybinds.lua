-- Keybind mappings.

local map = vim.api.nvim_set_keymap

-- Fundamental mappings / navigation.

options = { noremap = true }

map('n', '<enter>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)

