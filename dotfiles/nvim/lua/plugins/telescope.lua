-- Configuration for the Telescope fuzzy finder.

return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.3',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local wk = require('which-key')

    wk.register({
      f = {
        name = 'telescope',
        -- Files
        f = { '<cmd>Telescope find_files<cr>', 'Find file' },
        g = { '<cmd>Telescope live_grep<cr>', 'Grep in files' },
        t = { '<cmd>Telescope<cr>', 'Search Telescope' },
        p = { '<cmd>Telescope repo list bin=/usr/bin/fdfind<cr>', 'Search Projects' },
        c = { '<cmd>Telescope repo cached_list<cr>', 'Search Projects' },
        -- Vim
        b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
        h = { '<cmd>Telescope help_tags<cr>', 'Help' },
        x = { '<cmd>Telescope commands<cr>', 'Commands' },
        k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
        o = { '<cmd>Telescope vim_options<cr>', 'Options' },
        q = { '<cmd>Telescope quickfix<cr>', 'Quickfix' },
        ['.'] = { '<cmd>Telescope spell_suggest<cr>', 'Spell suggestion' },
        s = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Search buffer' },
        v = { '<cmd>Telescope treesitter<cr>', 'Treesitter' },
      },
    }, { prefix = '<leader>' })
  end
}

-- See also https://github.com/nvim-telescope/telescope.nvim
