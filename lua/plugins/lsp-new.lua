return {
  'mason-org/mason-lspconfig.nvim',
  event = 'VeryLazy',
  opts = {
    ensure_installed = {
      'lua_ls',
      'pyright',
      'ts_ls',
      'yamlls',
      'html',
      'eslint',
      'dockerls',
      'tailwindcss',
    },
  },
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {},
      event = 'VeryLazy',
    },
    {
      'neovim/nvim-lspconfig',
      event = 'VeryLazy',
      config = function()
        local blink_capabilities = require('blink.cmp').get_lsp_capabilities { include_nvim_defaults = true }
        vim.lsp.config('*', { capabilities = blink_capabilities })
      end,
    },
  },
}
