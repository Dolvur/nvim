return {
  'mason-org/mason-lspconfig.nvim',
  event = 'VeryLazy',
  -- lazy = false,
  config = function()
    require("mason-lspconfig").setup {
      automatic_enable = true,
      ensure_installed = {
        'lua_ls',
        'pyright',
        'ts_ls',
        'yamlls',
        'html',
        'eslint',
        'dockerls',
        'tailwindcss',
      }
    }
  end,
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {},
      event = 'VeryLazy',
      -- lazy = false,
    },
    {
      'neovim/nvim-lspconfig',
      event = 'VeryLazy',
      -- lazy = false,
      config = function()
        local blink_capabilities = require('blink.cmp').get_lsp_capabilities { include_nvim_defaults = true }

        vim.lsp.config('*', { capabilities = blink_capabilities })

        -- require('mason-lspconfig').setup_handlers({
        --   -- Default handler for all servers
        --   function(server_name)
        --     -- This tells mason-lspconfig to use vim.lsp.config instead of lspconfig
        --     vim.lsp.enable(server_name)
        --   end,
        --
        --   -- You can add server-specific configurations here if needed
        --   -- ['lua_ls'] = function()
        --   --   vim.lsp.config('lua_ls', {
        --   --     settings = {
        --   --       Lua = {
        --   --         diagnostics = { globals = { 'vim' } }
        --   --       }
        --   --     }
        --   --   })
        --   --   vim.lsp.enable('lua_ls')
        --   -- end,
        -- })
      end,
    },
  },
}
