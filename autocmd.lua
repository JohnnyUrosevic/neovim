vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local highlight_augroup = vim.api.nvim_create_augroup('highlight-cursor', { clear = true })

vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  group = highlight_augroup,
  callback = vim.lsp.buf.document_highlight,
})

vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
  group = highlight_augroup,
  callback = vim.lsp.buf.clear_references,
})
