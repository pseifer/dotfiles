-- Configuration for Haskell and haskell-language-server.

return {
	"mrcjkb/haskell-tools.nvim",
	version = "^3",
	ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
	config = function()
		local ht = require("haskell-tools")
		local bufnr = vim.api.nvim_get_current_buf()
		local def_opts = { noremap = true, silent = true, buffer = bufnr }

		local wk = require("which-key")

		-- Haskell LSP mappings.
		wk.register({
			l = {
				name = "LSP",
				-- Hoogle search for the type signature of the definition under the cursor
				h = { ht.hoogle.hoogle_signature, "hoogle signature" },
				-- Evaluate all code snippets
				C = { ht.lsp.buf_eval_all, "eval all (haskell)" },
			},
			r = {
				name = "repl",
				-- Toggle a GHCi repl for the current package.
				r = { ht.repl.toggle, "package" },
				-- Toggle a GHCi repl for the current buffer.
				f = {
					function()
						ht.repl.toggle(vim.api.nvim_buf_get_name(0))
					end,
					"buffer",
				},
				-- Quit repl.
				q = { ht.repl.quit, "quit" },
			},
		}, { prefix = "<leader>" })
	end,
}
