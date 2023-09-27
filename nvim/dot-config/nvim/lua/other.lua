function modify_hl(ns, name, changes)
    local def = vim.api.nvim_get_hl(ns, { name = name, link = false })
      vim.api.nvim_set_hl(ns, name, vim.tbl_deep_extend("force", def, changes))
end

local set_hl_for_floating_window = function()
  modify_hl(0, 'NormalFloat', { bg = '#44475a' })
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  desc = 'Avoid overwritten by loading color schemes later',
  callback = set_hl_for_floating_window,
})

