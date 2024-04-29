-- Configuration for VimWiki, Markdown, and todo.txt.

return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/Notes",
				syntax = "markdown",
				ext = ".md",
			},
		}
		vim.g.vimwiki_global_ext = 0
		vim.g.vimwiki_folding = "syntax"
	end,
}
