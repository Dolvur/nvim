return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    keys = {
      {
        '<leader>gd',
        function()
          require('gitsigns').diffthis()
        end,
        desc = 'Gitsigns: Diff buffer vs HEAD',
      },
      {
        '<leader>gb',
        function()
          require('gitsigns').blame_line { full = true }
        end,
        desc = 'Gitsigns: Blame line (full)',
      },
    },
  },
}
