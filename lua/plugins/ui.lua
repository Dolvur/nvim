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
    'HiPhish/rainbow-delimiters.nvim',
    lazy = false,
    main = 'rainbow-delimiters.setup',
    opts = {},
    event = 'BufRead',
  },
}
