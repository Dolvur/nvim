vim.pack.add {
  'https://github.com/lewis6991/gitsigns.nvim',
}

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>', { desc = 'Gitsigns: Diffview' })
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>', { desc = 'Gitsigns: Blame line' })
