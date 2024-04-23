-- Configuration for the UI.ui

return {

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

	-- Gruvmox Material
	-- - Works not as well as Everforest with redshift/flux.
	-- - Is similarly yellowish.
	--
	--{
	--	"sainnhe/gruvbox-material",
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		vim.o.background = "light" -- or 'light'
	--		vim.g.gruvbox_material_foreground = "original"
	--		vim.g.gruvbox_material_background = "medium"
	--		vim.cmd.colorscheme("gruvbox-material")
	--	end,
	--},

	-- Solarized
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
	--
	{
		"rmehri01/onenord.nvim",
		priority = 1000,
		config = function()
			require("onenord").setup({
				--theme = "light",
				--borders = true, -- Split window borders
				--fade_nc = false, -- Fade non-current windows, making them more distinguishable
				---- Style that is applied to various groups: see `highlight-args` for options
				--styles = {
				--	comments = "NONE",
				--	strings = "NONE",
				--	keywords = "NONE",
				--	functions = "NONE",
				--	variables = "NONE",
				--	diagnostics = "underline",
				--},
				--disable = {
				--	background = false, -- Disable setting the background color
				--	float_background = false, -- Disable setting the background color for floating windows
				--	cursorline = false, -- Disable the cursorline
				--	eob_lines = true, -- Hide the end-of-buffer lines
				--},
				---- Inverse highlight for different groups
				--inverse = {
				--	match_paren = false,
				--},
				--custom_highlights = {}, -- Overwrite default highlight groups
				--custom_colors = {}, -- Overwrite default colors
			})
			vim.cmd("colorscheme onenord")
			vim.o.background = "light"
		end,
	},

	-- Configuration for lualine.
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				separator = nil,
				options = {
					component_separators = "",
					section_separators = "",
					theme = "onenord",
				},
				-- tabline = {
				-- 	lualine_a = { "tabs" },
				-- 	lualine_b = {},
				-- 	lualine_c = {},
				-- 	lualine_x = {},
				-- 	lualine_y = {},
				-- 	lualine_z = {},
				-- },
			})
		end,
	},

	-- Configuration for bufferline.
	{
		"akinsho/bufferline.nvim",
		--lazy = false,
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					show_buffer_icons = false,
					buffer_close_icon = " ",
				},
			})
		end,
	},

	-- Configuration for the alpha greeter.
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[
                            󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟                          
                       󰧟󰧟󰧟                    
                    󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟                 
                 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟               
                󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟             
              󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟            
             󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟           
            󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟          
            󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟         
           󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟         
           󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟         
           󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟         
           󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟         
            󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟          
             󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟           
              󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟            
              󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟             
              󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟              
              󰧟󰧟󰧟󰧟󰧟󰧟              
              󰧟󰧟󰧟󰧟󰧟󰧟              
               󰧟          󰧟󰧟󰧟󰧟      󰧟󰧟󰧟󰧟 󰧟󰧟               
                   󰧟 󰧟󰧟  󰧟󰧟󰧟󰧟󰧟                  
                  󰧟󰧟󰧟󰧟                  
                        󰧟  󰧟󰧟                    
                         󰧟󰧟󰧟 󰧟                         
                           󰧟󰧟                          
                           󰧟 󰧟󰧟󰧟󰧟󰧟󰧟                           
                              󰧟 󰧟󰧟󰧟󰧟 󰧟                              
      ]]
			dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.buttons.val = {
				dashboard.button("e", "     New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "     Find files", ":Telescope find_files<CR>"),
				dashboard.button("p", "     Find projects", ":Telescope repo list bin=/usr/bin/fdfind<CR>"),
				dashboard.button("r", "     Find recent", ":Telescope oldfiles<CR>"),
				dashboard.button("w", "     Find wiki", ":Telescope find_files search_dirs={'$HOME/Notes'}<CR>"),
				dashboard.button("s", "     Settings", ":e $MYVIMRC<CR>"),
				dashboard.button("q", "     Quit", ":qa<CR>"),
			}
			alpha.setup(dashboard.opts)
		end,
	},
}

-- Storage for alternative splash images.

--       ▌▀██████████████████████████████████████████████▌▀▐             ▄▓
--          ███████████ ████ ███ ██  ████  ███████████▌░▀ ░            ■▀░   ▄░   ▄▐
--         |▐▓█▀▐█████  ████  █  █    ██    █████▓▓▓█▐■                ▄▒  ▀     ░
--           ░▐▌░▐▌███  ████  █  █  █    █  ██▓▓▓█▓▓▌   ░             ▀   ░░
--   ▓        ▐  ▀ ▌▓██  ██  ██  ▓  ██  ▓▓  ▓▓▓▓░░▀▌▐
--    ▒          ▐  ▐▒██    ▓▓▓ ▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▒▒░      ▬       ▄▄▬▬ -·  ·   ·─--- ·
--     ┐          ░  ▀▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▀▐ ▀▐      ▓     /▀
--    ░ ▄            ▀▐▀▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▌▓ ▌         ░░    .  - ══─--
--     ▒▒▓■             ▐ ▀▓▓▀▒▒▒▀▐▒▌▐▒▀ ▌ ■             ▄╝
--       ■▓■▬              ░▀ ▄▓▄░ ▒ ■▀▌ ░░            ▄▓▀*=-▬.   .
--     .▄  ░                ■  ░▀  ░        ░░       ▄▓░
--      ▐▄                 .                       ▄█▀*═─-. --                     ■
--     ░░ ▓              ░  ▀▄▬    ▄"            ▄▓▓▓▒▒▒▄▄▬▬─-    .____ __    _  ░░▀
--       ▒▒▄               ░░▄   ■▓  ▐░         ╚^^~~ ~
--        ▓▓▓▄                ▓■ ░   ░└▄         `┐         `,░      ■▀■       \
--          ■░░▀▬              ░      ▒▒▀         │░   ▓ ▓▌   ▐               ▄░ ▐▄▄
--             ▄            ■           ░■        |░░  ▄ ▄■   :     ║▐▓█      ▀▀ │▀▀
--        └▀▄▄                ░░         ▓▄       ;▓▬--- -   -┴ ─═▄ │▓██      █▓ ░██
--          ░░░░░■              ▀         ░'      .               ╣ :███      ─- ▐▬─
--       ░░   ▓▄                                    ▒=*- ··      ──.▄▓▓▬ ■       |
--         ▒▒▒▒▒▒▀■                                 ░            ■▄▒▒▒═ ▓
--             ░░░░▒▒▀▄                                        ▄░░░▄▬▄ ░
--                ░░░                                       ▬ ▄▄▄▄╔ ▄
--            ░░
--
--                                                 
--          ████ ██████           █████      ██
--         ███████████             █████ 
--         █████████ ███████████████████ ███   ███████████
--        █████████  ███    █████████████ █████ ██████████████
--       █████████ ██████████ █████████ █████ █████ ████ █████
--     ███████████ ███    ███ █████████ █████ █████ ████ █████
--    ██████  █████████████████████ ████ █████ █████ ████ ██████
--
--                         󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟
--                   󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧟
--               󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟
--            󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧟󰧟
--          󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟
--        󰧟󰧟󰧟󰧟󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧞󰧞󰧟
--      󰧟󰧟󰧟󰧟󰧟󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧟
--     󰧟󰧟󰧟󰧟󰧟󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞
--   󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞
--   󰧟󰧟󰧟󰧟󰧟󰧟󰧞 󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞
--  󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞 󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧟
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞 󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧞󰧞󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟
--  󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟
--  󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞
--   󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞 󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞
--    󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟
--     󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞          󰧟󰧞󰧞󰧞󰧟󰧟     󰧟󰧟󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞
--      󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟  󰧟 󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟 󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟
--        󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧞󰧞󰧞󰧟󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟
--          󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧟󰧞󰧟󰧞󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟
--            󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧟󰧞󰧟󰧞󰧞󰧞󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟
--               󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧟󰧞󰧟󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧞󰧟󰧟
--                   󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧞󰧞󰧞󰧞󰧞󰧟󰧟󰧟
--                           󰧟󰧟󰧟󰧟󰧞󰧟󰧞󰧟󰧞󰧟 󰧟󰧟󰧟
--
--                          󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--                     󰧟󰧟
--                󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--             󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--          󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--        󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--      󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--     󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--    󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟
--   󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--  󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--  󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟  󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
-- 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--  󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--  󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--   󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--    󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--     󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟          󰧟󰧟󰧟󰧟󰧟       󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--      󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟  󰧟  󰧟  󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--        󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--          󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--             󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--                󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟 󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--                     󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟󰧟
--                            󰧟󰧟󰧟󰧟 󰧟󰧟󰧟
