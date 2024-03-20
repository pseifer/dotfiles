-- Setup for lisps, mainly Clojure.

return {
	-- REPL interaction.
	"Olical/conjure",
	-- Paredit for Neovim.
	"julienvincent/nvim-paredit",
	config = function()
		require("nvim-paredit").setup({
			use_default_keys = true,
			filetypes = { "clojure" },
		})
	end,
}
