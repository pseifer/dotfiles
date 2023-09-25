-- alpha.nvim starter customization

return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')
    local logo = [[
    ▌▀██████████████████████████████████████████████▌▀▐             ▄▓         
       ██████████████████████████████████████████▌░▀ ░            ■▀░   ▄░   ▄▐
      |▐▓█▀▐████████████████████████████████▓▓▓█▐■                ▄▒  ▀     ░
        ░▐▌░▐▌███████████████████████████▓▓▓█▓▓▌   ░             ▀   ░░
▓        ▐  ▀ ▌▓████████████▓▓▓▓███▓▓▓▓▓▓▓▓░░▀▌▐
 ▒          ▐  ▐▒███████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░      ▬       ▄▄▬▬ -·  ·   ·─--- ·
  ┐          ░  ▀▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▀▐ ▀▐      ▓     /▀
 ░ ▄            ▀▐▀▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▌▓ ▌         ░░    .  - ══─--
  ▒▒▓■             ▐ ▀▓▓▀▒▒▒▀▐▒▌▐▒▀ ▌ ■             ▄╝
    ■▓■▬              ░▀ ▄▓▄░ ▒ ■▀▌ ░░            ▄▓▀*=-▬.   .
  .▄  ░                ■  ░▀  ░        ░░       ▄▓░
   ▐▄                 .                       ▄█▀*═─-. --                     ■
  ░░ ▓              ░  ▀▄▬    ▄"            ▄▓▓▓▒▒▒▄▄▬▬─-    .____ __    _  ░░▀
    ▒▒▄               ░░▄   ■▓  ▐░         ╚^^~~ ~
     ▓▓▓▄                ▓■ ░   ░└▄         `┐         `,░      ■▀■       \
       ■░░▀▬              ░      ▒▒▀         │░   ▓ ▓▌   ▐               ▄░ ▐▄▄
          ▄            ■           ░■        |░░  ▄ ▄■   :     ║▐▓█      ▀▀ │▀▀
     └▀▄▄                ░░         ▓▄       ;▓▬--- -   -┴ ─═▄ │▓██      █▓ ░██
       ░░░░░■              ▀         ░'      .               ╣ :███      ─- ▐▬─
    ░░   ▓▄                                    ▒=*- ··      ──.▄▓▓▬ ■       |
      ▒▒▒▒▒▒▀■                                 ░            ■▄▒▒▒═ ▓
          ░░░░▒▒▀▄                                        ▄░░░▄▬▄ ░
             ░░░                                       ▬ ▄▄▄▄╔ ▄
         ░░                                                                    
    ]]
    dashboard.section.header.val = vim.split(logo, '\n')
    dashboard.section.buttons.val = {
      dashboard.button( "e", "  ❯ New file" , ":ene <BAR> startinsert <CR>"),
      dashboard.button( "f", "  ❯ Find files", ":Telescope find_files<CR>"),
      dashboard.button( "p", "  ❯ Find projects", ":Telescope repo list bin=/usr/bin/fdfind<CR>"),
      dashboard.button( "r", "  ❯ Find recent", ":Telescope oldfiles<CR>"),
      dashboard.button( "s", "  ❯ Settings", ":e $MYVIMRC<CR>"),
      dashboard.button( "q", "   ❯ Quit", ":qa<CR>"),
    }
    alpha.setup(dashboard.opts)
  end
}

