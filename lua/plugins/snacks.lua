vim.pack.add {
  'https://github.com/folke/snacks.nvim',
}

require('snacks').setup {
  lazygit = { enabled = true },
  gitbrowse = { enabled = true },
  input = { enabled = true },
}

vim.keymap.set('n', '<leader>gg', function()
  Snacks.lazygit()
end, { desc = 'Lazygit' })

vim.keymap.set('n', '<leader>gB', function()
  Snacks.gitbrowse()
end, { desc = 'Git Browse' })
