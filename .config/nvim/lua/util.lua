-- Utility functions.

local map = function(mode, from, to, desc)
	vim.keymap.set(mode, from, to, { silent = true, noremap = true, desc = desc })
end

Nmap = function(from, to, desc)
	map("n", from, to, desc)
end

Imap = function(from, to, desc)
	map("i", from, to, desc)
end

Vmap = function(from, to, desc)
	map("v", from, to, desc)
end

Tmap = function(from, to, desc)
	map("t", from, to, desc)
end

Xmap = function(from, to, desc)
	map("x", from, to, desc)
end
