local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
end

map('<leader>uh', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled)
end, 'Toggle Inlay Hints')

