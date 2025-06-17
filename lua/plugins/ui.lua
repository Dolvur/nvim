return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
    opts = {
      preset = 'modern',
      delay = 0,
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
  {
    'folke/snacks.nvim',
    dependencies = {
      {
        'echasnovski/mini.sessions',
        version = false,
        config = function()
          require('mini.sessions').setup()
        end,
      },
    },
    opts = {
      scroll = { enabled = false },
      -- animate = { enabled = false }, -- Doesn't work, setting with vim.g.snacks_animate = false instead
      dashboard = {
        preset = {
          header = [[
   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
      },
    },
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    lazy = false,
    main = 'rainbow-delimiters.setup',
    opts = {},
    event = 'BufRead',
  },
}
