-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Splits and tabs
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set({ 'n', 'v' }, '<S-h>', 'gt', { desc = 'Go to next tab' })
vim.keymap.set({ 'n', 'v' }, '<S-l>', 'gT', { desc = 'Go to previous tab' })

-- Add empty lines without leaving normal
vim.keymap.set('n', '<cr>', 'o<ESC>', { desc = 'Insert empty line' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })

-- Interact with system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>c', '"+c', { desc = 'Change to system clipboard' })

vim.keymap.set('n', '<leader><leader>s', ':w<cr>', { desc = 'Save file' })

vim.keymap.set('n', 'glt', vim.lsp.buf.type_definition, { desc = 'LSP Type Definition' })
vim.keymap.set('n', 'gli', vim.lsp.buf.implementation, { desc = 'LSP Type Implementation' })
vim.keymap.set({ 'n', 'x' }, 'gla', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })
vim.keymap.set('n', 'glr', vim.lsp.buf.rename, { desc = 'LSP Rename' })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format Document' })

pcall(function()
  vim.keymap.del('n', 'grt')
  vim.keymap.del('n', 'gri')
  vim.keymap.del({ 'n', 'x' }, 'gra')
  vim.keymap.del('n', 'grn')
end)

vim.keymap.set({ "n", "v", "x" }, ";", ":")
vim.keymap.set({ "n", "v", "x" }, ":", ";")

vim.keymap.set({ 'n', 'v' }, '<Tab>', ">>")
vim.keymap.set({ 'n', 'v' }, '<S-Tab>', "<<")
vim.keymap.set("i", '<S-Tab>', "<C-o><<")

vim.keymap.set({ 'n', 'v' }, '<C-d>', "<C-d>zz")
vim.keymap.set({ 'n', 'v' }, '<C-u>', "<C-u>zz")
