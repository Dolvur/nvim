return {
  {
    'mikavilpas/yazi.nvim',
    -- lazy = false, -- To hijack netrw
    -- event = "VeryLazy",
    keys = {
      {
        '<leader>e',
        '<cmd>Yazi<cr>',
        desc = 'File Explorer',
      },
      {
        -- Open in the current working directory
        '<leader>E',
        '<cmd>Yazi cwd<cr>',
        desc = 'File Explorer (cwd)',
      },
    },
    opts = {
      open_for_directories = true,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
}
