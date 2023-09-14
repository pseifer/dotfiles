-- https://github.com/rockerBOO/awesome-neovim

-- Remap leader to space.

vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '

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

-- Plugin configuration.

local plugins = {
  { import = "plugins" }
}

local opts = {
  change_detection = {
    enabled = true,
    notify = false,
  },
}

require("lazy").setup(plugins, opts)
