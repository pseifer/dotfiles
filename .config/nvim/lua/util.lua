-- Utility functions.

map = function(mode, from, to, desc)
    vim.keymap.set(mode, from, to, { silent = true, noremap = true, desc = desc })
end

nmap = function(from, to, desc)
    map('n', from, to, desc)
end

imap = function(from, to, desc)
    map('i', from, to, desc)
end

vmap = function(from, to, desc)
    map('v', from, to, desc)
end

tmap = function(from, to, desc)
    map('t', from, to, desc)
end

