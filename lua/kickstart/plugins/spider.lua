return {
  'chrisgrieser/nvim-spider',
  keys = {
    {
      'w',
      "<cmd>lua require('spider').motion('w', { subwordMovement = false })<CR>",
      mode = { 'n', 'o', 'x' },
    },
    {
      'e',
      "<cmd>lua require('spider').motion('e', { subwordMovement = false })<CR>",
      mode = { 'n', 'o', 'x' },
    },
    {
      'b',
      "<cmd>lua require('spider').motion('b', { subwordMovement = false })<CR>",
      mode = { 'n', 'o', 'x' },
    },
    {
      '<leader>w',
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { 'n', 'o', 'x' },
    },
    {
      '<leader>e',
      "<cmd>lua require('spider').motion('e')<CR>",
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
