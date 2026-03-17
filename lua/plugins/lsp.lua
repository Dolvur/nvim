vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/mason-org/mason.nvim',
})

require('lazydev').setup()
require('mason').setup()

vim.keymap.set('n', '<leader>cm', function() vim.cmd('Mason') end, { desc = 'Mason' })

