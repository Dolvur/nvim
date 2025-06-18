return {
  {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
      -- scroll = { enabled = false },
      -- animate = { enabled = false }, -- Doesn't work, setting with vim.g.snacks_animate = false instead
      indent = {},
      lazygit = {},
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
    keys = {
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
        -- silent = true,
      },
    },
  },
}
