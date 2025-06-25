-- Core init.lua; handles lazy.nvim setup.

require("util") -- global utility functions.
require("private") -- global private variables (loaded from files).
require("lsp") -- lsp setup.

-- Disable deprecation warnings in plugins.

---@diagnostic disable-next-line: duplicate-set-field
vim.deprecate = function() end

-- Set <leader> to <Space>.

vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "

-- Bootstrap the 'Lazy' package manager.
-- Access with ':Lazy' or via 'l' in the greeter menu.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
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

-- Plugin configuration, load plugins (from lua/plugins/...).

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

require("settings") -- basic nvim settings.
require("diagnostics") -- settings for (LSP) diagnostics.
require("keybinds") -- basic nvim remappings.
require("spell") -- spell checking setup.
require("other") -- custom lua code.
