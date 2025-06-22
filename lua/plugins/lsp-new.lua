return {
  'mason-org/mason-lspconfig.nvim',
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
    },
    {
      'neovim/nvim-lspconfig',
      config = function()
        local blink_capabilities = require('blink.cmp').get_lsp_capabilities { include_nvim_defaults = true }
        vim.lsp.config('*', { capabilities = blink_capabilities })
      end,
    },
  },
}
