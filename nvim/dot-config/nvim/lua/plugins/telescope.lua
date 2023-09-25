-- Configuration for the Telescope fuzzy finder.

return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.3',
  dependencies = { 
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local builtin = require('telescope.builtin')
    local wk = require('which-key')
 
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('fzf')

    wk.register({
      f = {
        name = 'telescope',
        -- Meta: All modes
        t = { '<cmd>Telescope<cr>', 'Search Telescope' },
        -- Files
        f = { '<cmd>Telescope find_files<cr>', 'Find file (project root)' },
        F = { '<cmd>Telescope find_files search_dirs={"$HOME"}<cr>', 'Find file (~)' },
        g = { '<cmd>Telescope live_grep<cr>', 'Grep in files (project root)' },
        G = { '<cmd>Telescope live_grep search_dirs={"$HOME"}<cr>', 'Grep in files (~)' },
        p = { '<cmd>Telescope repo list bin=/usr/bin/fdfind<cr>', 'Search Projects' },
        P = { '<cmd>Telescope repo cached_list<cr>', 'Search Projects' },
        r = { '<cmd>Telescope oldfiles<cr>', 'Find recent file' },
        e = { '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>', 
              'File browser (current directory)' },
        E = { '<cmd>Telescope file_browser<cr>', 'File browser (project root)' },
        -- Vim
        b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
        s = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Search buffer' },
        h = { '<cmd>Telescope help_tags<cr>', 'Help' },
        x = { '<cmd>Telescope commands<cr>', 'Commands' },
        k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
        o = { '<cmd>Telescope vim_options<cr>', 'Options' },
        -- Other
        q = { '<cmd>Telescope quickfix<cr>', 'Quickfix' },
        ['.'] = { '<cmd>Telescope spell_suggest<cr>', 'Spell suggestion' },
        v = { '<cmd>Telescope treesitter<cr>', 'Treesitter' },
      },
    }, { prefix = '<leader>' })

  end
}

-- See also https://github.com/nvim-telescope/telescope.nvim
