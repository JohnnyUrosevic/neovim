vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/cpea2506/one_monokai.nvim' },
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/echasnovski/mini.nvim' },
  { src = 'https://github.com/tpope/vim-sleuth' },
  { src = 'https://github.com/justinmk/vim-sneak' },
  { src = 'https://github.com/folke/todo-comments.nvim' },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range("^1") },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/vim-scripts/ReplaceWithRegister' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/chrisgrieser/nvim-spider' },
  { src = 'https://github.com/chrisgrieser/nvim-various-textobjs' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/benomahony/oil-git.nvim' },
}

vim.cmd.colorscheme 'one_monokai'
vim.cmd.hi 'Comment gui=none'

require('mini.surround').setup()

require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

require('blink.cmp').setup()

require('oil').setup {
  columns = { 'icon' },
  keymaps = {
    ['<C-h>'] = false,
    ['<C-l>'] = false,
    ['<C-k>'] = false,
    ['<C-j>'] = false,
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
  },
  view_options = { show_hidden = true },
}

vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<C-\\>', ':vsplit<CR><CMD>Oil<CR>', { desc = 'Open parent directory' })

vim.keymap.set({ 'n', 'o', 'x' }, 'f', '<Plug>Sneak_f', { desc = 'Multiline f' })
vim.keymap.set({ 'n', 'o', 'x' }, 'F', '<Plug>Sneak_F', { desc = 'Multiline F' })
vim.keymap.set({ 'n', 'o', 'x' }, 't', '<Plug>Sneak_t', { desc = 'Multiline t' })
vim.keymap.set({ 'n', 'o', 'x' }, 'T', '<Plug>Sneak_T', { desc = 'Multiline T' })

vim.keymap.set({ 'n', 'x' }, 'w', "<cmd>lua require('spider').motion('w', { subwordMovement = false })<CR>")
vim.keymap.set({ 'n', 'x' }, 'e', "<cmd>lua require('spider').motion('e', { subwordMovement = false })<CR>")
vim.keymap.set({ 'n', 'x' }, 'b', "<cmd>lua require('spider').motion('b', { subwordMovement = false })<CR>")
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>w',
  "<cmd>lua require('spider').motion('w', { skipInsignificantPunctuation = false })<CR>")
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>e',
  "<cmd>lua require('spider').motion('e', { skipInsignificantPunctuation = false })<CR>")
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>b',
  "<cmd>lua require('spider').motion('b', { skipInsignificantPunctuation = false })<CR>")
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

require('nvim-treesitter').setup {
    auto_install = true,
    highlight = {
      enable = true,
    },
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
  current_line_blame = true,
}

local gitsigns = require 'gitsigns'

local function map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = vim.api.nvim_get_current_buf()
  vim.keymap.set(mode, l, r, opts)
end

-- Navigation
map('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal { ']c', bang = true }
  else
    gitsigns.nav_hunk 'next'
  end
end, { desc = 'Jump to next git [c]hange' })

map('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal { '[c', bang = true }
  else
    gitsigns.nav_hunk 'prev'
  end
end, { desc = 'Jump to previous git [c]hange' })

map('v', '<leader>hs', function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'git [s]tage hunk' })
map('v', '<leader>hr', function()
  gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'git [r]eset hunk' })
map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
map('n', '<leader>hD', function()
  gitsigns.diffthis '@'
end, { desc = 'git [D]iff against last commit' })
map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })


require('telescope').setup {
  defaults = {
    mappings = {
      i = { ['<C-s>'] = 'select_vertical' },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

