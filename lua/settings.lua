vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = function() end,
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = function() end,
  },
}

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.wrap = false

vim.diagnostic.config { virtual_lines = true }

vim.opt.timeout = false

vim.opt.winborder = 'rounded'

vim.lsp.enable({
  'lua_ls', 'cssls', 'ts_ls', 'nixd',
})

local hostname = vim.fn.trim(vim.fn.system("hostname"))
vim.lsp.config['nixd'] = {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import (builtins.getFlake(toString /home/goose/nix)).inputs.nixpkgs { }",
      },
      options = {
        nixos = {
          expr = "let flake = builtins.getFlake(toString /home/goose/nix); in flake.nixosConfigurations." .. hostname .. ".options",
        },
        formatting = {
          command = { "nixpkgs-fmt" },
        },
      },
    },
  },
}
