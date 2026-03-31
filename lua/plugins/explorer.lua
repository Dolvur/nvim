vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mikavilpas/yazi.nvim',
}

require('yazi').setup {
  -- open_for_directories = true,
}

-- vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>e', '<cmd>Yazi<CR>', { desc = 'File Explorer' })
vim.keymap.set('n', '<leader>E', '<cmd>Yazi cwd<CR>', { desc = 'File Explorer (cwd)' })
