-- Configuration for the UI.

return {
	-- The dracula color theme.
	"Mofiqul/dracula.nvim",

	-- Configuration for lualine.
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		opts = {
			theme = "dracula-nvim",
		},
		config = function()
			require("lualine").setup({
				separator = nil,
				options = {
					component_separators = "",
					section_separators = "",
				},
				tabline = {
					lualine_a = { "tabs" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
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
                                                                       


                                                                        
          ████ ██████           █████      ██                     
         ███████████             █████                             
         █████████ ███████████████████ ███   ███████████   
        █████████  ███    █████████████ █████ ██████████████   
       █████████ ██████████ █████████ █████ █████ ████ █████   
     ███████████ ███    ███ █████████ █████ █████ ████ █████  
    ██████  █████████████████████ ████ █████ █████ ████ ██████ 

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
