return {
  'chrisgrieser/nvim-various-textobjs',
  keys = {
    {
      'a<leader>w',
      '<cmd>lua require("various-textobjs").subword("outer")<CR>',
      mode = { 'o', 'x' },
    },
    {
      'i<leader>w',
      '<cmd>lua require("various-textobjs").subword("inner")<CR>',
      mode = { 'o', 'x' },
    },
    {
      'a<leader>e',
      '<cmd>lua require("various-textobjs").subword("outer")<CR>',
      mode = { 'o', 'x' },
    },
    {
      'i<leader>e',
      '<cmd>lua require("various-textobjs").subword("inner")<CR>',
      mode = { 'o', 'x' },
    },
  },
}
