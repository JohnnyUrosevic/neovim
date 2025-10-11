return {
  'chrisgrieser/nvim-various-textobjs',
  config = function()
    vim.keymap.set({ 'x', 'o' }, 'i<leader>w', '<cmd>lua require("various-textobjs").subword("inner")<cr>')
    vim.keymap.set({ 'x', 'o' }, 'a<leader>w', '<cmd>lua require("various-textobjs").subword("outer")<cr>')

    require('various-textobjs').setup {
      useDefaults = true,
      disabledDefaults = {
        'iS',
        'aS',
      },
    }
  end,
}
