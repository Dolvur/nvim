vim.pack.add {
  'https://github.com/ibhagwan/fzf-lua',
}

require('fzf-lua').setup()

local set = vim.keymap.set

set('n', '<leader>f', '<cmd>FzfLua files<CR>', { desc = 'Find Files' })

set('n', '<leader>sk', '<cmd>FzfLua keymaps<CR>', { desc = 'Search Keymaps' })
set('n', '<leader>sh', '<cmd>FzfLua helptags<CR>', { desc = 'Search Helptags' })
set('n', '<leader>sd', '<cmd>FzfLua diagnostics_document<CR>', { desc = 'Search Diagnostics' })

set('n', '<leader>:', '<cmd>FzfLua command_history<CR>', { desc = 'Command History' })
set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', { desc = 'Grep' })
set('n', '<leader>ut', '<cmd>FzfLua filetypes<CR>', { desc = 'Set Filetype' })
