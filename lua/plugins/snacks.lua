return {
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
      -- scroll = { enabled = false },
      -- animate = { enabled = false }, -- Doesn't work, setting with vim.g.snacks_animate = false instead
      indent = {},
      -- gitbrowse = {}, -- TODO: setup this
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
}
