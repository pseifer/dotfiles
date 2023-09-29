-- Core init.lua; handles lazy.nvim setup.

-- Remap <leader> to <Space>.

vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "

-- Bootstrap Lazy.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Plugin configuration, load plugins (see lua/plugins/...).

local plugins = {
	{ import = "plugins" },
}

local opts = {
	change_detection = {
		enabled = true,
		notify = false,
	},
}

require("lazy").setup(plugins, opts)

-- Load basic configurations (i.e., settings and essential keybinds).

require("settings")
require("keybinds")
require("other")
