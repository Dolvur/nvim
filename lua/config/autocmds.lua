--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--   -- buffer = event.buf,
--   -- group = highlight_augroup,
--   callback = vim.lsp.buf.document_highlight,
-- })
--
-- vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--   -- buffer = event.buf,
--   -- group = highlight_augroup,
--   callback = vim.lsp.buf.clear_references,
-- })
