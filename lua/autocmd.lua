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

-- Enable treesitter on file open and install any missing parsers
local function enable_treesitter(buf, language)
    vim.treesitter.start(buf, language)
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter.setup', {}),
  callback = function(args)
      local buf = args.buf
      local filetype = args.match

      local language = vim.treesitter.language.get_lang(filetype) or filetype
      local treesitter = require('nvim-treesitter')
      if vim.list_contains(treesitter.get_available(), language) then
          if not vim.list_contains(treesitter.get_installed(), language) then
              treesitter.install(language):await(function()
                enable_treesitter(buf, language)
              end)
          else
            enable_treesitter(buf, language)
          end

        end
  end,
})
