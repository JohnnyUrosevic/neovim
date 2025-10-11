vim.pack.add {
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
}

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

require('todo-comments').setup {
  signs = false,
}

require('nvim-autopairs').setup {
  check_ts = true,
}

vim.keymap.set({ 'n', 'o', 'x' }, 'f', '<Plug>ReplaceWithRegisterOperator', { desc = 'Replace with register' })
