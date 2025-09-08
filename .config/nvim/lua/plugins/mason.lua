-- General configuration for Mason, tool installer.

return {
	-- Package manager for linters, formatters, LSP and DAP servers.
	"williamboman/mason.nvim",
	dependencies = {
		-- Automatic installation of tools via mason.
		"WhoIsSethDaniel/mason-tool-installer",
		-- Extensions to ltex (installed by Mason below.
		"barreiroleo/ltex-extra.nvim",
	},

	config = function()
		-- (1)
		-- https://mason-registry.dev/registry/list
		require("mason").setup()
		-- (1.1) Install tools.
		-- Use :MasonToolsInstall or :MasonToolsUpdate
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Lua
				"lua-language-server", -- LSP
				"stylua", -- Formatter
				"luacheck", -- Linter (requires luarocks); unused

				-- Shell
				"shellcheck", -- Linter
				"shfmt", -- Formatter

				-- Python
				-- "pyright", -- LSP (manually installed via pipx install pyright)
				"basedpyright", -- LSP
				"black", -- Formatter

				-- C
				"clangd", -- C LSP
				"clang-format", -- Formatter

				-- Spelling
				-- 'misspell', -- Linter
				-- 'codespell' -- Linter
				"ltex-ls-plus", -- LanguageTool for LaTeX

				-- Git (commit messages).
				"gitlint", -- Linter

				-- Make.
				"checkmake", -- Linter

				-- Clojure
				"clojure-lsp", -- LSP

				-- Markdown
				"marksman",
			},
		})
	end,
}

--    TODO: Migrate to lsp/<tool>.lua
--
-- 		-- Python
-- 		lsp.pyright.setup({})
-- 		lsp.ruff.setup({})
--
-- 		-- Clojure
-- 		lsp.clojure_lsp.setup({})
--
-- 		-- C
-- 		lsp.clangd.setup({})
--
-- 		-- Zig
-- 		lsp.zls.setup({})
--
-- 		-- Markdown
-- 		lsp.marksman.setup({
-- 			-- Enable in vimwiki as well.
-- 			filetypes = { "markdown", "markdown.mdx", "vimwiki" },
-- 		})
--
-- 		-- Function to check if a floating dialog exists and if not
-- 		-- then check for diagnostics under the cursor
-- 		function OpenDiagnosticIfNoFloat()
-- 			for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
-- 				if vim.api.nvim_win_get_config(winid).zindex then
-- 					return
-- 				end
-- 			end
-- 			-- THIS IS FOR BUILTIN LSP
-- 			vim.diagnostic.open_float(0, {
-- 				scope = "cursor",
-- 				focusable = false,
-- 				close_events = {
-- 					"CursorMoved",
-- 					"CursorMovedI",
-- 					"BufHidden",
-- 					"InsertCharPre",
-- 					"WinLeave",
-- 				},
-- 			})
-- 		end
--
-- 		-- Show diagnostics under the cursor when holding position.
-- 		vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
-- 		vim.api.nvim_create_autocmd({ "CursorHold" }, {
-- 			pattern = "*",
-- 			command = "lua OpenDiagnosticIfNoFloat()",
-- 			group = "lsp_diagnostics_hold",
-- 		})
-- 	end,
-- }
