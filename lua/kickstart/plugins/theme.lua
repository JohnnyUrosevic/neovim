return {
  'cpea2506/one_monokai.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'one_monokai'

    vim.cmd.hi 'Comment gui=none'
  end,
}
