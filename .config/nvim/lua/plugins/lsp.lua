-- General configuration for Language Servers.

return {
	-- Add the lspconfig package.
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Package manager for linters, formatters, LSP and DAP servers.
		"williamboman/mason.nvim",
		-- Plugin for using linters with mason.
		"mfussenegger/nvim-lint",
		-- Plugin for integration between mason and lspconfig.
		"williamboman/mason-lspconfig.nvim",
		-- Plugin for formatter integration with Mason.
		"mhartington/formatter.nvim",
		-- Automatic installation of tools.
		"WhoIsSethDaniel/mason-tool-installer",
		-- Extensions to ltex.
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
				-- "luacheck", -- Linter (requires luarocks); unused

				-- Shell
				"shellcheck", -- Linter
				"shfmt", -- Formatter

				-- Python
				-- "pyright", -- LSP (manually installed via pipx install pyright)
				"ruff", -- LSP
				"black", -- Formatter

				-- C
				"clangd", -- C LSP
				"clang-format",

				-- Spelling
				-- 'misspell', -- Linter
				-- 'codespell' -- Linter
				"ltex-ls-plus", -- LanguageTool for LaTeX

				-- Clojure
				"clojure-lsp",

				-- Markdown
				"marksman",
			},
		})

		-- (2) Setup mason-lspconfig bridge.
		require("mason-lspconfig").setup({})

		-- (3) Setup language servers.
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
		local lsp = require("lspconfig")
		-- Python
		lsp.pyright.setup({})
		lsp.ruff.setup({})
		-- Clojure
		lsp.clojure_lsp.setup({})
		-- C
		lsp.clangd.setup({})
		-- Zig
		lsp.zls.setup({})
		-- Markdown
		lsp.marksman.setup({
			-- Enable in vimwiki as well.
			filetypes = { "markdown", "markdown.mdx", "vimwiki" },
		})
		-- LanguageTool
		lsp.ltex_plus.setup({
			on_attach = function(_, _)
				-- Note: Requires installation of ltex_extra (see dependencies above)!
				require("ltex_extra").setup({
					load_langs = { "en-US" },
					path = vim.fn.expand("~") .. "/.local/share/ltex",
				})
			end,
			-- Delay
			flags = { debounce_text_changes = 300 },
			settings = {
				ltex = {
					language = "en-US",
					languageToolHttpServerUri = "https://api.languagetoolplus.com/",
					languageToolOrg = {
						username = vim.g.language_tool_api_mail,
						apiKey = vim.g.language_tool_api_key,
					},
					additionalRules = {
						enablePickyRules = true,
						motherTongue = "de",
					},
					disabledRules = {
						["en-US"] = { "CURRICULUM_VITAE" },
					},
					latex = {
						commands = {
							["\\bookmarksetup{}"] = "ignore",
						},
						environments = {
							["mathpar"] = "ignore",
							["algorithm"] = "ignore",
							["algorithmic"] = "ignore",
						},
					},
					checkFrequency = "edit",
					sentenceCacheSize = 10000,
					enabled = {
						"bib",
						"gitcommit",
						"html",
						"markdown",
						"org",
						"pandoc",
						"plaintex",
						"mail",
						"tex",
						"latex",
						"text",
						"xhtml",
					},
				},
			},
		})

		-- Lua
		lsp.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							"vim",
							"require",
						},
					},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		})

		-- (4) Setup formatters.
		-- https://github.com/mhartington/formatter.nvim
		require("formatter").setup({
			filetype = {
				python = {
					require("formatter.filetypes.python").black,
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				sh = {
					require("formatter.filetypes.sh").shfmt,
				},
			},
		})

		-- (5) Setup linters.
		-- https://github.com/mfussenegger/nvim-lint
		require("lint").linters_by_ft = {
			sh = { "shellcheck" },
			-- lua = { "luacheck" },
		}

		-- Run on save.
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
				vim.cmd(":FormatWrite")
			end,
		})

		-- Function to check if a floating dialog exists and if not
		-- then check for diagnostics under the cursor
		function OpenDiagnosticIfNoFloat()
			for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
				if vim.api.nvim_win_get_config(winid).zindex then
					return
				end
			end
			-- THIS IS FOR BUILTIN LSP
			vim.diagnostic.open_float(0, {
				scope = "cursor",
				focusable = false,
				close_events = {
					"CursorMoved",
					"CursorMovedI",
					"BufHidden",
					"InsertCharPre",
					"WinLeave",
				},
			})
		end
		-- Show diagnostics under the cursor when holding position.
		vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
		vim.api.nvim_create_autocmd({ "CursorHold" }, {
			pattern = "*",
			command = "lua OpenDiagnosticIfNoFloat()",
			group = "lsp_diagnostics_hold",
		})
	end,
}
