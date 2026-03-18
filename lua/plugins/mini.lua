vim.pack.add {
  'https://github.com/nvim-mini/mini.nvim',
}

-- TODO: Read up more on what this changes
require('mini.basics').setup {
  options = {
    extra_ui = true,
  },
  mappings = {
    option_toggle_prefix = '<leader>u',
  },
}

require('mini.icons').setup()
require('mini.surround').setup()
