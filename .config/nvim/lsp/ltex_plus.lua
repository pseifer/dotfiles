return {
	cmd = { "ltex-ls-plus" },
	filetypes = {
		"bib",
		"tex",
		"latex",
		"markdown",
		"html",
		"xhtml",
		"org",
		"pandoc",
	},
	-- root_markers = { ".git" },
	on_attach = function(_, _)
		-- Note: Requires installation of ltex_extra (see dependencies above)!
		require("ltex_extra").setup({
			load_langs = { "en-US" },
			path = vim.fn.expand("~") .. "/.local/share/ltex",
		})
	end,
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
				"tex",
				"latex",
				"markdown",
				"html",
				"xhtml",
				"org",
				"pandoc",
			},
		},
	},
}
