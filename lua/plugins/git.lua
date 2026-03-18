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

vim.keymap.set('n', '<leader>gd', function()
  vim.cmd 'Gitsigns diffthis'
end, { desc = 'Gitsigns: Diffview' })

vim.keymap.set('n', '<leader>gb', function()
  vim.cmd 'Gitsigns blame_line'
end, { desc = 'Gitsigns: Blame line' })
