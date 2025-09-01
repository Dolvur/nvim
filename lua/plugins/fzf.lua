return {
  {
    'ibhagwan/fzf-lua',
    -- lazy = false,
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {
      winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        preview = {
          scrollchars = { "┃", "" },
        },
      },
      -- files = {
      --   cwd_prompt = false,
      --   actions = {
      --     ["alt-i"] = { require('fzf-lua').config.actions.toggle_ignore },
      --     ["alt-h"] = { require('fzf-lua').config.actions.toggle_hidden },
      --   },
      -- },
    },
    config = function(_, opts)
      local set = vim.keymap.set
      local fzf = require 'fzf-lua'
      -- files
      set('n', '<leader>f', '<cmd>FzfLua files<CR>', { desc = 'Find Files' })
      set('n', '<leader>F', function()
        fzf.files { cwd = vim.fn.expand '%:p:h' }
      end, { desc = 'Find Files' })
      -- vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua files<CR>", { desc = "Find Old files" })
      -- vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua files<CR>", { desc = "Find Old files" })

      -- search
      set('n', '<leader>sk', '<cmd>FzfLua keymaps<CR>', { desc = 'Search Keymaps' })
      set('n', '<leader>sh', '<cmd>FzfLua helptags<CR>', { desc = 'Search Helptags' })
      set('n', '<leader>sd', '<cmd>FzfLua diagnostics_document<CR>', { desc = 'Search Diagnostics' })

      set('n', '<leader>:', '<cmd>FzfLua command_history<CR>', { desc = 'Command History' })
      set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', { desc = 'Grep' })
      set('n', '<leader>ut', '<cmd>FzfLua filetypes<CR>', { desc = 'Set Filetype' })

      require('fzf-lua').setup(opts)
    end,
  },
}
