-- Configuration for lualine.

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  opts = {
    theme = 'dracula-nvim'
  },
  config = function()
    require('lualine').setup {
      separator = nil,
      options = {
        component_separators = '',
        section_separators = '',
      },
      tabline = {
        lualine_a = {'tabs'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
    }
  end
}

