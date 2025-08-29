vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.tex',
  callback = function()
    vim.fn.jobstart({ 'xelatex', '-interaction=nonstopmode', vim.fn.expand '%' }, { detach = true })
  end,
})
