vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mikavilpas/yazi.nvim',
}

vim.keymap.set('n', '<leader>e', '<cmd>Yazi<CR>', { desc = 'File Explorer' })
vim.keymap.set('n', '<leader>E', '<cmd>Yazi cwd<CR>', { desc = 'File Explorer (cwd)' })
