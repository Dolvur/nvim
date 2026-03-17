local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
end

vim.keymap.set('n', '<leader>ud', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle Diagnostics' })

map('<leader>cd', function()
  vim.diagnostic.open_float()
end, 'Show diagnostics')

map('gd', '<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<CR>', 'Goto Definition')
map('grr', '<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<CR>', 'References')

map('gy', function()
  vim.lsp.buf.type_definition()
end, 'Goto Type Definition')

map('gK', function()
  vim.lsp.buf.signature_help()
end, 'Signature Help')

map('<leader>uh', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled)
end, 'Toggle Inlay Hints')
