vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mikavilpas/yazi.nvim'
})

vim.keymap.set('n', '<leader>e', function() vim.cmd('Yazi') end, { desc = 'File Explorer' })
vim.keymap.set('n', '<leader>E', function() vim.cmd('Yazi cwd') end, { desc = 'File Explorer (cwd)' })

