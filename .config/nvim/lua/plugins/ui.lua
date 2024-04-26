-- Configuration for the UI.

return {

	-- Contrast-based "Zenbones" theme.
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

	-- Configuration for LuaLine.
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				separator = nil,
				options = {
					component_separators = "",
					section_separators = "",
					theme = "zenbones",
				},
			})
		end,
	},

	-- Configuration for BufferLine.
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

-- END

-- Storage for color theme configs.
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
