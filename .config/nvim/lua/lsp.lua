local servers = {
	"lua_ls",
	"ltex_plus",
}

vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.lsp.enable(servers)
vim.diagnostic.enable(false)
