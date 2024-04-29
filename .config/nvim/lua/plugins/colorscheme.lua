-- Contrast-based "Zenbones" theme.

return {
	{
		"mcchrish/zenbones.nvim",
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			--require("zenbones").setup({
			--})
			vim.cmd("colorscheme zenbones")
			vim.o.background = "light"
			-- Background: #F0EDEC
			-- Fix BuffeLine background color (blend with main background).
			vim.cmd.hi("BufferLineFill guibg=#F0EDEC")
		end,
	},
}

--
-- Gruvmox Material Theme.
--{
--	"sainnhe/gruvbox-material",
--	lazy = false,
--	priority = 1000,
--	config = function()
--		vim.o.background = "dark"
--		vim.g.gruvbox_material_foreground = "material"
--		vim.g.gruvbox_material_background = "medium"
--		vim.cmd.colorscheme("gruvbox-material")
--		-- Universal fix for plugins that fuck up BufferLineFill:
--		vim.cmd.hi("BufferLineFill guibg=#282828")
--		--vim.cmd.hi("BufferLineFill guibg=#fbf1c7") -- (light mode)
--		-- Set telescope selection to not-ugyl.
--		vim.cmd.hi("TelescopeSelection guibg=#32302f")
--	end,
--},

--{
--	"rmehri01/onenord.nvim",
--	priority = 1000,
--	config = function()
--		require("onenord").setup({
--			theme = "light",
--		})
--		vim.cmd("colorscheme onenord")
--		vim.o.background = "light"
--	end,
--},
--
--
-- Everforest
-- + Works really well with redshift/flux.
-- - Very yellowish and thus a bit ugly.
--
--{
--	"sainnhe/everforest",
--	priority = 1000,
--	config = function()
--		vim.o.background = "light" -- or 'light'
--		vim.cmd("colorscheme everforest")
--	end,
--},

-- Solarized -- Need better implementation.
-- ~ Works OK with redshift/flux.
-- ~ Not as yellowish as Gruvbox or Everforest.
--
--{
--	"Tsuzat/NeoSolarized.nvim",
--	lazy = false, -- make sure we load this during startup if it is your main colorscheme
--	priority = 1000, -- make sure to load this before all the other start plugins
--	config = function()
--		require("NeoSolarized").setup({
--			style = "light",
--			transparent = false,
--			terminal_colors = true,
--			enable_italics = true,
--		})
--		vim.o.background = "dark"
--		vim.cmd([[ colorscheme NeoSolarized ]])
--	end,
--},

-- Catpuccin
-- + Nice neutral grey.
-- - Does not work so well with redshift/flux.
--
--{
--	"catppuccin/nvim",
--	name = "catppuccin",
--	priority = 1000,
--	config = function()
--		vim.cmd("colorscheme catppuccin-latte")
--	end,
--},

-- Onenord
-- + Nice neutral grey
-- + redshift? Pretty good.
-- + Really good vim plugin.
--{
--	"rmehri01/onenord.nvim",
--	priority = 1000,
--	config = function()
--		require("onenord").setup({
--			theme = "light",
--		})
--		vim.cmd("colorscheme onenord")
--		vim.o.background = "light"
--	end,
--},

-- Nightfox + Variants
--{
--	"EdenEast/nightfox.nvim",
--	config = function()
--		vim.cmd("colorscheme dayfox")
--	end,
--},
