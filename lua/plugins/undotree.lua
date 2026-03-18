vim.pack.add {
  'https://github.com/mbbill/undotree',
}

vim.keymap.set('n', '<leader>uu', '<cmd>UndotreeToggle<CR>', { desc = 'Toggle undotree' })
