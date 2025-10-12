vim.pack.add {
  { src = 'https://github.com/cpea2506/one_monokai.nvim' },
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/echasnovski/mini.nvim' },
  { src = 'https://github.com/tpope/vim-sleuth' },
  { src = 'https://github.com/justinmk/vim-sneak' },
  { src = 'https://github.com/folke/todo-comments.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/vim-scripts/ReplaceWithRegister' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/chrisgrieser/nvim-spider' },
  { src = 'https://github.com/chrisgrieser/nvim-various-textobjs' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
}

vim.cmd.colorscheme 'one_monokai'
vim.cmd.hi 'Comment gui=none'

require('mini.surround').setup()

require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

require('oil').setup {
  columns = { 'icon' },
  keymaps = {
    ['<C-h>'] = false,
    ['<C-l>'] = false,
    ['<C-k>'] = false,
    ['<C-j>'] = false,
    ['<M-h>'] = 'actions.select_split',
  },
  view_options = { show_hidden = true },
}

-- Open parent directory in current window
vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

vim.keymap.set({ 'n', 'o', 'x' }, 'f', '<Plug>Sneak_f', { desc = 'Multiline f' })
vim.keymap.set({ 'n', 'o', 'x' }, 'F', '<Plug>Sneak_F', { desc = 'Multiline F' })
vim.keymap.set({ 'n', 'o', 'x' }, 't', '<Plug>Sneak_t', { desc = 'Multiline t' })
vim.keymap.set({ 'n', 'o', 'x' }, 'T', '<Plug>Sneak_T', { desc = 'Multiline T' })

vim.keymap.set({ 'n', 'x' }, 'w', "<cmd>lua require('spider').motion('w', { subwordMovement = false })<CR>")
vim.keymap.set({ 'n', 'x' }, 'e', "<cmd>lua require('spider').motion('e', { subwordMovement = false })<CR>")
vim.keymap.set({ 'n', 'x' }, 'b', "<cmd>lua require('spider').motion('b', { subwordMovement = false })<CR>")
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>w', "<cmd>lua require('spider').motion('w', { skipInsignificantPunctuation = false })<CR>")
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>e', "<cmd>lua require('spider').motion('e', { skipInsignificantPunctuation = false })<CR>")
vim.keymap.set({ 'x', 'o' }, 'i<leader>w', '<cmd>lua require("various-textobjs").subword("inner")<cr>')
vim.keymap.set({ 'x', 'o' }, 'a<leader>w', '<cmd>lua require("various-textobjs").subword("outer")<cr>')


require('various-textobjs').setup {
  useDefaults = true,
  disabledDefaults = {
    'iS',
    'aS',
  },
}

require('todo-comments').setup {
  signs = false,
}

require('nvim-autopairs').setup {
  check_ts = true,
}

vim.keymap.set({ 'n', 'x' }, 'gr', '<Plug>ReplaceWithRegisterOperator', { desc = 'Replace with register' })

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}
