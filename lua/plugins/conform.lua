vim.pack.add {
  'https://github.com/stevearc/conform.nvim',
}

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    jsonc = { 'prettier' },
    svelte = { 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
    graphql = { 'prettier' },
    bash = { 'prettier' },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = 'fallback' }
  end,
}

vim.keymap.set('n', '<leader>cf', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = 'Format buffer' })

vim.keymap.set('n', '<leader>uf', function()
  local buf = vim.api.nvim_get_current_buf()

  vim.b[buf].disable_autoformat = not vim.b[buf].disable_autoformat
  local autoformat_status = vim.b[buf].disable_autoformat and 'disabled' or 'enabled'
  vim.notify('[Buffer] Autoformat on save ' .. autoformat_status)
end, { desc = 'Toggle autoformat on save' })

vim.keymap.set('n', '<leader>uF', function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  local autoformat_status = vim.g.disable_autoformat and 'disabled' or 'enabled'
  vim.notify('Autoformat on save ' .. autoformat_status)
end, { desc = 'Toggle autoformat on save' })
