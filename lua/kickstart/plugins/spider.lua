return {
  'chrisgrieser/nvim-spider',
  keys = {
    {
      'w',
      "<cmd>lua require('spider').motion('w', { subwordMovement = false })<CR>",
      mode = { 'n', 'x' },
    },
    {
      'e',
      "<cmd>lua require('spider').motion('e', { subwordMovement = false })<CR>",
      mode = { 'n', 'x' },
    },
    {
      'b',
      "<cmd>lua require('spider').motion('b', { subwordMovement = false })<CR>",
      mode = { 'n', 'x' },
    },
    {
      '<leader>w',
      "<cmd>lua require('spider').motion('w', { skipInsignificantPunctuation = false })<CR>",
      mode = { 'n', 'o', 'x' },
    },
    {
      '<leader>e',
      "<cmd>lua require('spider').motion('e', { skipInsignificantPunctuation = false })<CR>",
      mode = { 'n', 'o', 'x' },
    },
    -- Conflicts with breakpoints, maybe change later
    -- {
    --   '<leader>b',
    --   "<cmd>lua require('spider').motion('b')<CR>",
    --   mode = { 'n', 'o', 'x' },
    -- },
  },
}
